# coding=utf-8

import pandas as pd
import os, sys
import logging
from jinja2 import FileSystemLoader, Environment, PackageLoader


class Table(object):
    def __init__(self, name, name_zh, fields, primary_keys, max_field_length):
        self.name = name
        self.name_zh = name_zh
        self.fields = fields
        self.primary_keys = primary_keys
        self.max_field_length = max_field_length


class Field(object):
    def __init__(self, name, type, name_zh, is_primary=False, is_first=False, is_last=False):
        self.name = self.check_value(name)
        self.type = self.check_value(type)
        self.name_zh = self.check_value(name_zh)
        self.is_primary = is_primary
        self.is_first = is_first
        self.is_last = is_last

    def check_value(self, value):
        value=value.strip()
        if ' ' in value:
            logging.warning('值中包含空格，请检查字段,值为：%s' % value)
        if ';' in value:
            logging.warning('值中包含分号，请检查字段,值为：%s' % value)
        return value


if __name__ == '__main__':
    # 读取文件
    df = pd.read_excel('ods_f_u.xlsx')
    # columns = df.columns
    tables = []
    for (name, name_zh), group in df.groupby(['表名', '中文表名']):
        fields = []
        primary_keys = []
        # 字段最大长度
        max_field_length = max(group['字段'].map(len))
        # 字段处理
        row_index = 1
        for index, row in group.iterrows():
            is_primary = False
            # 是否是主键
            if row['主键'] == '√':
                primary_keys.append(row['字段'])
                is_primary = True
            # 是否是第一个字段
            is_first = False
            if row_index == 1:
                is_first = True
            # 是否是最后一个字段
            is_last = False
            if row_index == len(group):
                is_last = True
            row_index += 1
            # 实例化字段对象
            field = Field(row['字段'], row['字段类型'], row['中文名'] if isinstance(row['中文名'], str) else '', is_primary,
                          is_first,
                          is_last)
            # 添加字段到字段列表
            fields.append(field)
        # 实例化表
        table = Table(name, name_zh, fields, primary_keys, max_field_length)
        tables.append(table)
    # 循环处理
    for table in tables:
        # 模板解析
        # for field in fields:
        # print(field.name_en)
        # j2_env = Environment(loader=FileSystemLoader(os.path.dirname(__file__)+'/templates'))
        # j2_env = Environment(loader=PackageLoader('test', 'templates'))
        file_name, extension_name = os.path.splitext(os.path.basename(__file__))
        j2_env = Environment(loader=PackageLoader(file_name, 'templates'), trim_blocks=True)
        # j2_env = Environment(loader=PackageLoader(file_name))
        content = j2_env.get_template('ods_f_u.tmp').render(table=table)
        # 解析结果入文件
        with open('build/%s.hql' % table.name, 'w', encoding='utf8') as f:
            f.write(content)
        f.close()
