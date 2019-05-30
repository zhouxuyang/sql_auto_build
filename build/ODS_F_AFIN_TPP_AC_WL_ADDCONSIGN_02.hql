-- 创建目标表
CREATE TABLE IF NOT EXISTS ODS_F_AFIN_TPP_AC_WL_ADDCONSIGN_02
(
     ACCTNAME       STRING    COMMENT    '户名'
    ,OTHERNAME      STRING    COMMENT    '别名'
    ,KACCTNO        STRING    COMMENT    '卡号'
    ,KLASTACCTNO    STRING    COMMENT    '卡号后四位'
    ,ZACCTNO        STRING    COMMENT    '折号'
    ,ZLASTACCTNO    STRING    COMMENT    '折号后四位'
    ,CELL           STRING    COMMENT    '手机号'
    ,CERTTYPE       STRING    COMMENT    '证件类型'
    ,CERTNO         STRING    COMMENT    '证件号'
    ,ACCTTYPE       STRING    COMMENT    '信用卡/借记卡标识'
    ,LIMITAMT       STRING    COMMENT    '单笔支付限额'
    ,LIMITDAYAMT    STRING    COMMENT    '日累计支付限额'
    ,PASSWORD       STRING    COMMENT    '微支付密码'
    ,STATE          STRING    COMMENT    '微支付状态'
    ,AMOUNTDAY      STRING    COMMENT    '当日支付金额'
    ,PTIMES         STRING    COMMENT    '当日支付次数'
    ,LASTPDATE      STRING    COMMENT    '最后支付日期'
    ,CHNLID         STRING    COMMENT    '渠道号'
    ,CVV2           STRING    COMMENT    '信用卡CVV2'
    ,EXPDATE        STRING    COMMENT    '信用卡有效期'
    ,DEPTSEQ        STRING    COMMENT    '开户机构号'
    ,ERRORTIMES     STRING    COMMENT    '错误次数'
    ,ERRORDATE      STRING    COMMENT    '错误日期'
    ,SIGNDATE       STRING    COMMENT    '签约日期'
    ,CONSIGNDATE    STRING    COMMENT    '首次签约日期'
)COMMENT '表_WL'
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY '\t'
STORED AS orc
;