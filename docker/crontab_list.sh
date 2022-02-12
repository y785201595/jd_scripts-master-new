# 每3天的23:50分清理一次日志(互助码不清理，proc_file.sh对该文件进行了去重)
50 23 */3 * * find /scripts/logs -name '*.log' | grep -v 'sharecodeCollection' | grep -v '111' | xargs rm -rf
#收集助力码
30 * * * * sh +x /scripts/docker/auto_help.sh collect >> /scripts/logs/auto_help_collect.log 2>&1
#设置助力码
35 * * * * \cp /scripts/logs/111.log /scripts/logs/sharecodeCollection.log
##############短期活动##############

#京东小魔方
0 3,13 * * * node /scripts/jd_xmf.js >> /scripts/logs/jd_xmf.log 2>&1

#天天压岁钱
0 10,13 * * * node /scripts/jx_ttysq.js >> /scripts/logs/jx_ttysq.log 2>&1

#jd_nhs_rpb.js
0 0,23 * * * node /scripts/jd_nhs_rpc.js >> /scripts/logs/jd_nhs_rpc.log 2>&1

#jd_cjhz.js
0 3,23 * * * node /scripts/jd_cjhz.js >> /scripts/logs/jd_cjhz.log 2>&1

#jd_nhs_red.js
0 0,12,23 * * * node /scripts/jd_nhs_red.js >> /scripts/logs/jd_nhs_red.log 2>&1

#jd_mpdzcar_help
0 7 * * * node /scripts/jd_mpdzcar_help.js >> /scripts/logs/jd_mpdzcar_help.log 2>&1

#jjd_mpdzcar_gamer
0 5,9,13 * * * node /scripts/jd_mpdzcar_game.js >> /scripts/logs/jjd_mpdzcar_game.log 2>&1

#jd_mpdzcar
0 10 * * * node /scripts/jd_mpdzcar.js >> /scripts/logs/jd_mpdzcar.log 2>&1

#把智能生活带给TA
0 23 * * * node /scripts/jd_bzlshdgt.js >> /scripts/logs/jd_bzlshdgt.log 2>&1

#京东小魔方--收集兑换
31 8 * * * node /scripts/jd_mofang_ex.js >> /scripts/logs/jd_mofang_ex.log 2>&1

#年货签到
27 11 13-23 9 * node /scripts/jd_UnknownTask5.js >> /scripts/logs/jd_UnknownTask5.log 2>&1

#爆裂豆豆游戏
21 20,21 * * * node /scripts/jd_wxgame.js >> /scripts/logs/jd_wxgame.log 2>&1

#年货签到
0 8 1,2 * * node /scripts/jd_nh_sign.js >> /scripts/logsjd_nh_sign.log 2>&1

#京东通天塔--签到
31 8 * * * node /scripts/jd_m_sign.js >> /scripts/logs/jd_m_sign.log 2>&1

#会场红包雨
21 20,21 * * * node /scripts/jd_hc_rain.js >> /scripts/logs/jd_hc_rain.log 2>&1

#大势新品赏
1 0,22 * * * node /scripts/jd_desire.js >> /scripts/logs/jd_desire.log 2>&1

#战队投注
19 8 * * * node /scripts/jjd_zd.js >> /scripts/logs/jd_zd.log 2>&1

#京东特价--翻翻乐
27 0,6-23 * * * node /scripts/jd_jdtj_winner.js >> /scripts/logs/jd_jdtj_winner.log 2>&1

#写情书抽京豆
13 1,14 12-25 12 * node /scripts/jd_xqscjd.js >> /scripts/logs/jd_xqscjd.log 2>&1

京车会签到
19 8 * * * node /scripts/jd_jchsign.js >> /scripts/logs/jd_jchsign.log 2>&1

#京喜签到-喜豆
30 2,9 * * * node /scripts/jx_sign_xd.js >> /scripts/logs/jx_sign_xd.log 2>&1

#见缝插针
15 10 * * * node /scripts/jd_jfcz.js >> /scripts/logs/jd_jfcz.log 2>&1

#京东工业品
10 7 * 12 * node /scripts/jd_gyp.js >> /scripts/logs/jd_gyp.log 2>&1

#整点京豆雨
0 * * * * node /scripts/jd_redrain.js >> /scripts/logs/jd_redrain.log 2>&1

#半点京豆雨
30 20-23/1 * * * node /scripts/jd_redrain_half.js >> /scripts/logs/jd_redrain_half.log 2>&1

#京东小魔方--收集兑换
31 2,8 * * * node /scripts/jd_mofang_j.js >> /scripts/logs/jd_mofang_j.log 2>&1

#京东我的理想家
10 7 * * * node /scripts/jd_lxLottery.js >> /scripts/logs/jd_lxLottery.log 2>&1

#金榜年终奖
10 0,2 * * * node /scripts/jd_split.js >> /scripts/logs/jd_split.log 2>&1

#高通晓龙
10 9,17 * * * node /scripts/jd_jd_xiaolong.js >> /scripts/logs/jd_xiaolong.log 2>&1

#京东生鲜每日抽奖
10 7 * * * node /scripts/jd_sxLottery.js >> /scripts/logs/jd_sxLottery.log 2>&1

#京东东东世界兑换
0 0 * * * node /scripts/jd_ddworld_exchange.js >> /scripts/logs/jd_ddworld_exchange.log 2>&1

#京东东东世界
15 3,9 * * * node /scripts/jd_ddworld.js >> /scripts/logs/jd_ddworld.log 2>&1

#京东签到翻牌
10 8 * * * node /scripts/jd_sign_graphics1.js >> /scripts/logs/jd_sign_graphics.log 2>&1

#京东金榜
13 6 * * * node /scripts/jd_gold_sign.js >> /scripts/logs/jd_gold_sign.log 2>&1

#京喜财富岛合成生鲜
45 * * * * node /scripts/jd_cfd_fresh.js >> /scripts/logs/jd_cfd_fresh.log 2>&1

#京东答题
9 10 * * * node /scripts/jd_dt.js >> /scripts/logs/jd_dt.log 2>&1

#京东APP-搜索-超级盒子
24 3,13 * * * node /scripts/jd_cjhz.js >> /scripts/logs/jd_cjhz.log 2>&1


#热血心跳,狂解压
10 2,9,17 * * * node /scripts/jd_vivo.js >> /scripts/logs/jd_vivo.log 2>&1

#柠檬是兄弟就砍我2
0 5,17 * * * node /scripts/jd_kyd.js >> /scripts/logs/jd_kyd.log 2>&1

#奇怪的潮玩儿制躁团
23 11,12 * * * node /scripts/jd_zzt.js >> /scripts/logs/jd_zzt.log 2>&1

#手机助力
10 0,8 * * * node /scripts/jd_carnivalcity_help.js >> /scripts/logs/jd_carnivalcity_help.log 2>&1

#APP-美妆馆-右侧浮窗
23 9,10 * * * node /scripts/jd_selectionOfficer.js >> /scripts/logs/d_selectionOfficer.log 2>&1

#惊喜大作战
50 1 * * * node /scripts/jd_jxdzz.js >> /scripts/logs/jd_jxdzz.log 2>&1

#活动入口：微信小程序-京东电器-首页抽盲盒
0 0,8 * * * node /scripts/jd_dqmh.js >> /scripts/logs/jd_dqmh.log 2>&1

#限时抢京豆
11 0,9 * * * node /scripts/jd_xsqjd.js >> /scripts/logs/jd_xsqjd.log 2>&1

#东东超市抢京豆
11 0,9 * * * node /scripts/jd_fission.js >> /scripts/logs/jd_fission.log 2>&1

#天天P图
18 0,18 * * * node /scripts/jd_ttpt.js >> /scripts/logs/jd_ttpt.log 2>&1

#集魔方
6 8,20 * * * node /scripts/jd_jmf.js >> /scripts/logs/jd_jmf.log 2>&1

#热血心跳,狂解压
5 6,18 1-16,21-30 9,10 * node /scripts/jd_decompression.js >> /scripts/logs/jd_decompression.log 2>&1

#竞速榜
10 1,7,20 * * * node /scripts/jd_jingsubang.js >> /scripts/logs/jd_jingsubang.log 2>&1

#京喜-首页-牛牛福利
1 0,9,19,23 * * * node /scripts/jd_nnfls.js >> /scripts/logs/jd_nnfls.log 2>&1

#手机竞猜
30 0 * * * node /scripts/jd_sjjc.js >> /scripts/logs/jd_sjjc.log 2>&1

#双11环游记大富翁
40 0,17 * * * node /scripts/jd_fanli.js >> /scripts/logs/jd_fanli.log 2>&1

#活动路径：边玩边赚->京小鸽吾悦寄
15 3,6 * * * node /scripts/jd_jxg.js >> /scripts/logs/jd_jxg.log 2>&1

#内容鉴赏官
15 3,6 * * * node /scripts/jd_connoisseur.js >> /scripts/logs/jd_connoisseur.log 2>&1

#集萌宝得团圆礼包
10 0,8,23 * * * node /scripts/jd_jika.js >> /scripts/logs/jd_jika.log 2>&1

#领券中心签到
33 7,19 * * * node /scripts/jd_dwapp.js >> /scripts/logs/jd_dwapp.log 2>&1

#领券中心签到
15 0 * * * node /scripts/jd_ccSign.js >> /scripts/logs/jd_ccSign.log 2>&1

#开学充电站
30 1 * * * node /scripts/jd_kxcdz.js >> /scripts/logs/logsjd_kxcdz.log 2>&1

#众筹许愿池
40 0,2 * * * node /scripts/jd_wish.js >> /scripts/logs/jd_wish.log 2>&1

#8.13-8.25 骁龙品牌日
18 9,19 13-25 8 * node /scripts/jd_xl.js >> /scripts/logs/jd_xl.log 2>&1

#特务Z
13 15,19 * * * node /scripts/jd_productZ4Brand.js >> /scripts/logs/jd_productZ4Brand.log 2>&1

#8.12-8.20 汽车生活节
30 9,21 12-20 8 * node /scripts/jd_qcshj.js >> /scripts/logs/jd_qcshj.log 2>&1

#柠檬众筹许愿池
0 8,12 * * * node /scripts/jd_xyc.js >> /scripts/logs/jd_xyc.log 2>&1

#活动路径  手机馆---》IQOO大牌日---〉左下角金机馆
33 6,9 8-20 8 * node /scripts/jd_goldPhone.js >> /scripts/logs/jd_goldPhone.log 2>&1

##8.4-8.15 七夕情报局🐶
36 0,10,21 4-15 8 * node /scripts/jd_qixi.js >> /scripts/logs/jd_qixi.log 2>&1

#8月粉丝互动
1 8 * * * node /scripts/jd_wxFans.js >> /scripts/logs/jd_wxFans.log 2>&1

#财福岛气球
0 0-23/6 * * * node /scripts/jd_cfd_loop.js >> /scripts/logs/jd_cfd_loop.log 2>&1

#半点京豆雨
30 16-23/1 * * * node /scripts/jd_half_redrain.js >> /scripts/logs/jd_half_redrain.log 2>&1

#图形签到
26 1,9 * * * node /scripts/jd_sign_graphics.js >> /scripts/logs/jd_sign_graphics.log 2>&1

#首页-领京豆-升级赚京豆
5 0-23/6 * * * node /scripts/jd_wsdlb.js >> /scripts/logs/jd_wsdlb.log 2>&1

#首页-领京豆-升级赚京豆
21 9 * * * node /scripts/jd_ljd.js >> /scripts/logs/jd_ljd.log 2>&1

#赚30元
3 1,6 * * * node /scripts/jd_earn30.js >> /scripts/logs/jd_earn30.log 2>&1

#京喜财富岛提现
59 11,12,23 * * * node /scripts/jd_cfdtx.js >> /scripts/logs/jd_cfdtx.log 2>&1

#发财大赢家
##1 6-22/3 * * * node /scripts/jd_fcdyj.js >> /scripts/logs/jd_fcdyj.log 2>&1

#摇钱树助力
0-59/30 1-23/2 * * *  node /scripts/jd_moneyTree_help.js >> /scripts/logs/jd_moneyTree_help.log 2>&1

#宠汪汪偷好友积分与狗粮
#10 1-21/3 * * *  node /scripts/jd_joy_steal.js >> /scripts/logs/jd_joy_steal.log 2>&1

#柠檬赚金币
0 5 * * * node /scripts/jd_zjb.js >> /scripts/logs/jd_zjb.log 2>&1

#京东图形签到
14 10,20 * * * node /scripts/jd_sign.js >> /scripts/logs/jd_sign.log 2>&1

#天天优惠大乐透
15 6 * * * node /scripts/jd_DrawEntrance.js >> /scripts/logs/jd_DrawEntrance.log 2>&1

#店铺签到
26 1,9 * * * node /scripts/jd_dpqd.js >> /scripts/logs/jd_dpqd.log 2>&1


#燃动夏季_SH助力
12 7-14 * * * node /scripts/jd_summer_movement_help.js >> /scripts/logs/jd_summer_movement_help.log 2>&1

#汪汪乐园养joy
20 0-23/3 * * * node /scripts/jd_joy_park.js >> /scripts/logs/jd_joy_park.log 2>&1

#早起福利
30 6 * * * node /scripts/jd_zqfl.js >> /scripts/logs/jd_zqfl.log 2>&1

#燃动夏季
25 0,6-23/2 * * * node /scripts/jd_summer_movement.js >> /scripts/logs/jd_summer_movement.log 2>&1

#汪汪乐园开工位
#0 9 * * * node /scripts/jd_joy_park_open.js >> /scripts/logs/jd_joy_park_open.log 2>&1

#汪汪乐园每日任务
0 9 * * * node /scripts/jd_joy_park_task.js >> /scripts/logs/jd_joy_park_task.log 2>&1

#全面抢京豆
08 12-13 * * * node /scripts/jd_qjd.js >> /scripts/logs/jd_qjd.log 2>&1

#柠檬京东零食街
0 11 * * * node /scripts/jd_lsj.js >> /scripts/logs/jd_lsj.log 2>&1

#欧洲狂欢杯
#57 59 9  * * * node /scripts/jd_europeancup.js >> /scripts/logs/jd_europeancup.log 2>&1

# 一分钱抽奖
10 0 * * * node /scripts/jd_lottery_drew.js >> /scripts/logs/jd_lottery_drew.log 2>&1

#推一推
30 7 * * * node /scripts/jd_tuijinbi.js >> /scripts/logs/jd_tuijinbi.log 2>&1

#特物Z
#18 11,21 * * * node /scripts/jd_tewuZ.js >> /scripts/logs/jd_tewuZ.log 2>&1

#东东乐园
#30 7 * * * node /scripts/jd_ddly.js >> /scripts/logs/jd_ddly.log 2>&1

#京东到家果园水车收水滴任务
#*/20 * * * * node /scripts/jd_jddj_fruit_collectWater.js >> /scripts/logs/jd_jddj_fruit_collectWater.log 2>&1

#京东到家鲜豆庄园收水滴
#3*/20 * * * * node /scripts/jd_jddj_getPoints.js >> /scripts/logs/jd_jddj_getPoints.log 2>&1

#京京东到家鲜豆庄园
#10 0 * * * node /scripts/jd_jddj_plantBeans.js >> /scripts/logs/jd_jddj_plantBeans.log 2>&1

#京东魔盒
0 0,1-23/3 * * * node /scripts/jd_mohe.js >> /scripts/logs/jd_mohe.log 2>&1

# 省钱大赢家-翻翻乐
1 0,8 * * * node /scripts/jd_sqffl.js >> /scripts/logs/jd_sqffl.log 2>&1

# 京东到家果园任务
#10 0,3,8,11,17 * * * node /scripts/jd_jddj_fruit.js >> /scripts/logs/jd_jddj_fruit.log 2>&1

#整点京豆雨
30 20 * * * node /scripts/jd_super_redrain.js >> /scripts/logs/jd_super_redrain.log 2>&1

# 京喜牧场
20 0-23/3 * * * node /scripts/jd_jxmc.js >> /scripts/logs/jd_jxmc.log 2>&1

#女装盲盒 活动时间：2021-05-1到2021-05-31
35 1,23 * * * node /scripts/jd_nzmh.js >> /scripts/logs/jd_nzmh.log 2>&1

#京喜工厂开团
5/15 1 * * * node /scripts/jd_dreamFactory_tuan.js >> /scripts/logs/jd_dreamFactory_tuan.log 2>&1

#明星小店(星店长)
0 1,21 * * * node /scripts/ jd_star_shop.js >> /scripts/logs/ jd_star_shop.js 2>&1

#京东极速版红包(活动时间：2021-5-5至2021-5-31)
45 0,23 * * * node /scripts/jd_speed_redpocke.js >> /scripts/logs/jd_speed_redpocke.log 2>&1

#超级直播间红包雨(活动时间不定期，出现异常提示请忽略。红包雨期间会正常)
1,31 0-23/1 * * * node /scripts/jd_live_redrain.js >> /scripts/logs/jd_live_redrain.log 2>&1

#每日抽奖(活动时间：2021-05-01至2021-05-31)
#13 1,22,23 * * * node /scripts/jd_daily_lottery.js >> /scripts/logs/jd_daily_lottery.log 2>&1
#城城领现金
#33 * * * * node /scripts/jd_city.js >> /scripts/logs/jd_city.log 2>&1

#手机狂欢城
0 0,12,18,21 * * * node /scripts/jd_carnivalcity.js >> /scripts/logs/jd_carnivalcity.log 2>&1
#618动物联萌
#33 * * * * node /scripts/jd_zoo.js >> /scripts/logs/jd_zoo.log 2>&1

#家电星推官 活动时间：2021年5月27日 00:00:00-2021年6月18日 23:59:59
0 0 * * * node /scripts/jd_xtg.js >> /scripts/logs/jd_xtg.log 2>&1
#家电星推官 活动时间：2021年5月27日 00:00:00-2021年6月18日 23:59:59
#0 0 * * * node /scripts/jd_xtg_help.js >> /scripts/logs/jd_xtg_help.log 2>&1
#金榜创造营 活动时间：2021-05-21至2021-12-31
#0 1,22 * * * node /scripts/jd_gold_creator.js >> /scripts/logs/jd_gold_creator.log 2>&1
#京享值PK
#15 0,6,13,19,21 * * * node /scripts/jd_pk.js >> /scripts/logs/jd_pk.log 2>&1
#京东沸腾之夜(5.31日有效)
#0 15-19/1 * * * node /scripts/jd_party_night.js >> /scripts/logs/jd_party_night.log 2>&1
##############长期活动##############
#送豆得豆
15 2,14,22 * * * node /scripts/jd_sddd.js >> /scripts/logs/jd_sddd.log 2>&1
#电竞经理
#15 10 * * * node /scripts/zooElecsport.js >> /scripts/logs/zooElecsport.log 2>&1
# 签到
7 0,17 * * * cd /scripts && node jd_bean_sign.js >> /scripts/logs/jd_bean_sign.log 2>&1
# 东东超市兑换奖品
0,30 0 * * * node /scripts/jd_blueCoin.js >> /scripts/logs/jd_blueCoin.log 2>&1
# 摇京豆
6 0,23 * * * node /scripts/jd_club_lottery.js >> /scripts/logs/jd_club_lottery.log 2>&1
# 东东农场
15 6-18/6 * * * node /scripts/jd_fruit.js >> /scripts/logs/jd_fruit.log 2>&1
# 宠汪汪
#0 0-23/4 * * * node /scripts/jd_joy.js >> /scripts/logs/jd_joy.log 2>&1
# 宠汪汪积分兑换京豆
#0 0-16/8 * * * node /scripts/jd_joy_reward.js >> /scripts/logs/jd_joy_reward.log 2>&1
# 宠汪汪喂食
#35 */1 * * * node /scripts/jd_joy_feedPets.js >> /scripts/logs/jd_joy_feedPets.log 2>&1
# 宠汪汪邀请助力
#10 13-20/1 * * * node /scripts/jd_joy_run.js >> /scripts/logs/jd_joy_run.log 2>&1
# 摇钱树
23 */2 * * * node /scripts/jd_moneyTree.js >> /scripts/logs/jd_moneyTree.log 2>&1
# 东东萌宠
35 6-18/6 * * * node /scripts/jd_pet.js >> /scripts/logs/jd_pet.log 2>&1
# 京东种豆得豆
10 7-22/1 * * * node /scripts/jd_plantBean.js >> /scripts/logs/jd_plantBean.log 2>&1
# 京东全民开红包
12 0-23/4 * * * node /scripts/jd_redPacket.js >> /scripts/logs/jd_redPacket.log 2>&1
# 进店领豆
6 0 * * * node /scripts/jd_shop.js >> /scripts/logs/jd_shop.log 2>&1
# 东东超市
31 0,1-23/2 * * * node /scripts/jd_superMarket.js >> /scripts/logs/jd_superMarket.log 2>&1
# 取关京东店铺商品
45 23 * * * node /scripts/jd_unsubscribe.js >> /scripts/logs/jd_unsubscribe.log 2>&1
# 京豆变动通知
20 10,21 * * * node /scripts/jd_bean_change.js >> /scripts/logs/jd_bean_change.log 2>&1
# 京东抽奖机
0 0,12,23 * * * node /scripts/jd_lotteryMachine.js >> /scripts/logs/jd_lotteryMachine.log 2>&1
# 京东排行榜
21 9 * * * node /scripts/jd_rankingList.js >> /scripts/logs/jd_rankingList.log 2>&1
# 天天提鹅
28 * * * * node /scripts/jd_daily_egg.js >> /scripts/logs/jd_daily_egg.log 2>&1
# 金融养猪
32 0-23/6 * * * node /scripts/jd_pigPet.js >> /scripts/logs/jd_pigPet.log 2>&1
# 点点券
40 0,20 * * * node /scripts/jd_necklace.js >> /scripts/logs/jd_necklace.log 2>&1
# 京喜工厂
50 * * * * node /scripts/jd_dreamFactory.js >> /scripts/logs/jd_dreamFactory.log 2>&1
# 东东小窝
46 6,23 * * * node /scripts/jd_small_home.js >> /scripts/logs/jd_small_home.log 2>&1
# 东东工厂
26 * * * * node /scripts/jd_jdfactory.js >> /scripts/logs/jd_jdfactory.log 2>&1
# 赚京豆(微信小程序)
12 * * * * node /scripts/jd_syj.js >> /scripts/logs/jd_syj.log 2>&1
# 京东快递签到
47 1 * * * node /scripts/jd_kd.js >> /scripts/logs/jd_kd.log 2>&1
# 京东汽车(签到满500赛点可兑换500京豆)
0 0 * * * node /scripts/jd_car.js >> /scripts/logs/jd_car.log 2>&1
# 领京豆额外奖励(每日可获得3京豆)
23 1,12,22 * * * node /scripts/jd_bean_home.js >> /scripts/logs/jd_bean_home.log 2>&1
# 微信小程序京东赚赚
6 0-5/1,11 * * * node /scripts/jd_jdzz.js >> /scripts/logs/jd_jdzz.log 2>&1
# crazyJoy自动每日任务
#30 7,23 * * * node /scripts/jd_crazy_joy.js >> /scripts/logs/jd_crazy_joy.log 2>&1
# 京东汽车旅程赛点兑换金豆
0 0 * * * node /scripts/jd_car_exchange.js >> /scripts/logs/jd_car_exchange.log 2>&1
# 导到所有互助码
23 7 * * * node /scripts/jd_get_share_code.js >> /scripts/logs/jd_get_share_code.log 2>&1
# 口袋书店
38 8,12,18 * * * node /scripts/jd_bookshop.js >> /scripts/logs/jd_bookshop.log 2>&1
# 京喜农场
30 9,12,18 * * * node /scripts/jd_jxqd.js >> /scripts/logs/jd_jxqd.log 2>&1
# 签到领现金
10 */4 * * * node /scripts/jd_cash.js >> /scripts/logs/jd_cash.log 2>&1
# 京喜app签到
29 7,17 * * * node /scripts/jx_sign.js >> /scripts/logs/jx_sign.log 2>&1
# 闪购盲盒
47 8 * * * node /scripts/jd_sgmh.js >> /scripts/logs/jd_sgmh.log 2>&1
# 京东秒秒币
10 6 * * * node /scripts/jd_ms.js >> /scripts/logs/jd_ms.log 2>&1
#美丽研究院
41 7,12,19 * * * node /scripts/jd_beauty.js >> /scripts/logs/jd_beauty.log 2>&1
#京东保价
#41 0,23 * * * node /scripts/jd_price.js >> /scripts/logs/jd_price.log 2>&1
#京东极速版签到+赚现金任务
21 1,6,18 * * * node /scripts/jd_speed_sign.js >> /scripts/logs/jd_speed_sign.log 2>&1
#监控crazyJoy分红
#10 12 * * * node /scripts/jd_crazy_joy_bonus.js >> /scripts/logs/jd_crazy_joy_bonus.log 2>&1
#京喜财富岛
5 */6 * * * node /scripts/jd_cfd.js >> /scripts/logs/jd_cfd.log 2>&1
# 删除优惠券(默认注释，如需要自己开启，如有误删，已删除的券可以在回收站中还原，慎用)
#20 9 * * 6 node /scripts/jd_delCoupon.js >> /scripts/logs/jd_delCoupon.log 2>&1
#家庭号
10 6,7 * * * node /scripts/jd_family.js >> /scripts/logs/jd_family.log 2>&1
#京东直播（又回来了）
30-50/5 12,23 * * * node /scripts/jd_live.js >> /scripts/logs/jd_live.log 2>&1
#京东健康社区
13 1,6,22 * * * node /scripts/jd_health.js >> /scripts/logs/jd_health.log 2>&1
#京东健康社区收集健康能量
5-45/20 * * * * node /scripts/jd_health_collect.js >> /scripts/logs/jd_health_collect.log 2>&1
# 幸运大转盘
10 10,23 * * * node /scripts/jd_market_lottery.js >> /scripts/logs/jd_market_lottery.log 2>&1
# 领金贴
5 0 * * * node /scripts/jd_jin_tie.js >> /scripts/logs/jd_jin_tie.log 2>&1
# 跳跳乐瓜分京豆
15 0,12,22 * * * node /scripts/jd_jump.js >> /scripts/logs/jd_jump.log 2>&1
