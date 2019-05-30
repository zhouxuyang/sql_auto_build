-- 创建目标表
CREATE TABLE IF NOT EXISTS ODS_F_AFIN_TPP_AC_TB_ADDCONSIGN_02
(
     SIGNNO              INT       COMMENT    '卡通协议号'
    ,NAME                STRING    COMMENT    '顾客姓名'
    ,CERTTYPE            STRING    COMMENT    '证件种类'
    ,CERTNO              STRING    COMMENT    '证件号码'
    ,GENDER              STRING    COMMENT    '性别'
    ,ZIPCODE             STRING    COMMENT    '邮政编码'
    ,ADDRESS             STRING    COMMENT    '地址'
    ,PHONE               STRING    COMMENT    '固定电话'
    ,CELL                STRING    COMMENT    '客户手机'
    ,EMAIL               STRING    COMMENT    '第三方账号E-mail'
    ,LIMITAMT            STRING    COMMENT    '支付限额'
    ,AMOUNTPRDAY         STRING    COMMENT    '每日支付金额'
    ,PRTIMES             STRING    COMMENT    '每日支付次数'
    ,LASTPRDATE          STRING    COMMENT    '最后支付日期'
    ,AMOUNTWRDAY         STRING    COMMENT    '每日提现金额'
    ,WRTIMES             STRING    COMMENT    '每日提现次数'
    ,LASTWRDATE          STRING    COMMENT    '最后提现日期'
    ,AMOUNTRRDAY         STRING    COMMENT    '每日退货金额'
    ,RRTIMES             STRING    COMMENT    '每日退货次数'
    ,LASTRRDATE          STRING    COMMENT    '最后退货日期'
    ,GREENACCTNO         STRING    COMMENT    '储户账号'
    ,ACCTFLAG            STRING    COMMENT    '账号标志'
    ,OPENORGANCODE       STRING    COMMENT    '储蓄系统里的开户机构代码'
    ,OTHERID             STRING    COMMENT    '储蓄系统里的客户号'
    ,MAINGREENACCTNO     STRING    COMMENT    '储蓄主账号'
    ,STATE               STRING    COMMENT    '当前状态'
    ,ORGANCODE           STRING    COMMENT    '机构代号'
    ,OPERCODE            STRING    COMMENT    '加办操作员'
    ,CONSIGNDATE         STRING    COMMENT    '加办日期'
    ,MODIFYORGANCODE     STRING    COMMENT    '变动机构代号'
    ,MODIFYOPERCODE      STRING    COMMENT    '变动操作员'
    ,MODIFYDATE          STRING    COMMENT    '变动日期'
    ,CARDTYPE            STRING    COMMENT    '联名卡类型'
    ,OLDGREENACCTNO      STRING    COMMENT    '老绿卡卡号'
    ,CHECKDATE           STRING    COMMENT    '与第三方对账时所确认的日期'
    ,REMARK              STRING    COMMENT    '注释'
    ,BUSINESSTYPECODE    STRING    COMMENT    '签约公司'
    ,CHNLNO              STRING    COMMENT    '渠道号'
    ,TEL_TYPE            STRING    COMMENT    '客户信息平台电子联系地址类型'
    ,ACCTNO_FLAG         STRING    COMMENT    '账号白名单标志'
    ,SERIALNO            STRING    COMMENT    '订单号'
    ,ACCTSERIAL          STRING    COMMENT    '邮储第三方支付系统流水号'
    ,BKACCTLV1           STRING    COMMENT    ''
)COMMENT '表_TB'
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY '\t'
STORED AS orc
;