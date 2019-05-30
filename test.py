import pandas as pd
import os
import logging
from jinja2 import Template


class Table(object):
    def __init__(self, name, fields, primary_keys, max_field_length):
        self.name = name
        self.fields = fields
        self.primary_keys = primary_keys
        self.max_field_length = max_field_length


class Field(object):
    def __init__(self, name_en, name_zh, is_primary):
        self.name_en = name_en.replace(' ', '')
        self.name_zh = name_zh
        self.is_primary = is_primary




if __name__ == '__main__':
    # 读取文件
    df = pd.read_excel('ods_f_u.xlsx')
    columns = df.columns
    tables = []
    for name, group in df.groupby('表名称'):
        fields = []
        primary_keys = []
        # 字段最大长度
        max_field_length = max(group['字段'].map(len))
        for index, row in group.iterrows():
            key = False
            if row['主键'] == '√':
                primary_keys.append(row['字段'])
                key = True
            field = Field(row['字段'], row['中文名'], key)
            fields.append(field)
        table = Table(name, fields, primary_keys, max_field_length)
        tables.append(table)
    # 循环处理
    for table in tables:
        with open('hql/%s.hql'%table.name,'wb') as f:
            pass
        template = Template('template/ods_f_u.tmp')
        content = template.render(name='周旭阳')
        print(content)
