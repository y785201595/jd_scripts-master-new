#!/bin/env python3
# -*- coding: utf-8 -*
'''
感谢Curtin提供的其他脚本供我参考
感谢aburd ch大佬的指导
项目名称:jd_health_exchange.py
Author: 一风一扬
功能：健康社区兑换
Date: 2021-08-12
cron: 9 1,15 * * * jd_health_exchange.py
new Env('JD健康社区兑换');



教程：本脚本默认兑换20京豆，需要8W积分，默认保留10W积分，有18W积分以上才兑换20京豆

cron时间填写：兑换京豆随意写，如果是其他商品，根据相关时间填写

'''
#如果不想兑换京豆，ENV设置： export heath_noexchage='x'
# x填写数字，x对应cookies中第几个账号，如果中间有黑号，黑号不算。多个账号不兑换用&隔开，例如2&3&4
heath_noexchage='2&3&4'

##############默认保留10W积分，18W积分才兑换20京豆############
###想保留其他分数，ENV设置： export least='xxx'
least = '180000'

# 20京豆id为4
id = '4'


#每秒点击兑换次数...适当调整，手机会发烫
#ENV设置： export dd_thread=30
dd_thread = '30'



######################################################以下代码请不要乱改######################################

UserAgent = ''


import requests
import time,datetime
import requests,re,os,sys,random,json
from urllib.parse import quote, unquote
import threading
import urllib3
#urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

requests.packages.urllib3.disable_warnings()




today = datetime.datetime.now().strftime('%Y-%m-%d')
tomorrow=(datetime.datetime.now() + datetime.timedelta(days=1)).strftime('%Y-%m-%d')
starttime = '23:59:58.00000000'

pwd = os.path.dirname(os.path.abspath(__file__)) + os.sep
path = pwd + "env.sh"

script_name = '健康社区兑换-Python'

jd_host='https://api.m.jd.com/'

functionId=''

body = '{}'

uuid = ''


def printT(s):
    print("[{0}]: {1}".format(datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"), s))
    sys.stdout.flush()

def getEnvs(label):
    try:
        if label == 'True' or label == 'yes' or label == 'true' or label == 'Yes':
            return True
        elif label == 'False' or label == 'no' or label == 'false' or label == 'No':
            return False
    except:
        pass
    try:
        if '.' in label:
            return float(label)
        elif '&' in label:
            return label.split('&')
        elif '@' in label:
            return label.split('@')
        else:
            return int(label)
    except:
        return label



class getJDCookie(object):
#     # 适配各种平台环境ck
#
#     def getckfile(self):
#         global v4f
#         curf = pwd + 'JDCookies.txt'
#         v4f = '/jd/config/config.sh'
#         ql_new = '/ql/config/env.sh'
#         ql_old = '/ql/config/cookie.sh'
#         if os.path.exists(curf):
#             with open(curf, "r", encoding="utf-8") as f:
#                 cks = f.read()
#                 f.close()
#             r = re.compile(r"pt_key=.*?pt_pin=.*?;", re.M | re.S | re.I)
#             cks = r.findall(cks)
#             if len(cks) > 0:
#                 return curf
#             else:
#                 pass
#         if os.path.exists(ql_new):
#             printT()("当前环境青龙面板新版")
#             return ql_new
#         elif os.path.exists(ql_old):
#             printT()("当前环境青龙面板旧版")
#             return ql_old
#         elif os.path.exists(v4f):
#             printT()("当前环境V4")
#             return v4f
#         return curf
#
#     # 获取cookie
#     def getCookie(self):
#         global cookies
#         ckfile = self.getckfile()
#         try:
#             if os.path.exists(ckfile):
#                 with open(ckfile, "r", encoding="utf-8") as f:
#                     cks = f.read()
#                     f.close()
#                 if 'pt_key=' in cks and 'pt_pin=' in cks:
#                     r = re.compile(r"pt_key=.*?pt_pin=.*?;", re.M | re.S | re.I)
#                     cks = r.findall(cks)
#                     if len(cks) > 0:
#                         if 'JDCookies.txt' in ckfile:
#                             printT()("当前获取使用 JDCookies.txt 的cookie")
#                         cookies = ''
#                         for i in cks:
#                             if 'pt_key=xxxx' in i:
#                                 pass
#                             else:
#                                 cookies += i
#                         return
#             else:
#                 with open(pwd + 'JDCookies.txt', "w", encoding="utf-8") as f:
#                     cks = "#多账号换行，以下示例：（通过正则获取此文件的ck，理论上可以自定义名字标记ck，也可以随意摆放ck）\n账号1【Curtinlv】cookie1;\n账号2【TopStyle】cookie2;"
#                     f.write(cks)
#                     f.close()
#             if "JD_COOKIE" in os.environ:
#                 if len(os.environ["JD_COOKIE"]) > 10:
#                     cookies = os.environ["JD_COOKIE"]
#                     printT()("已获取并使用Env环境 Cookie")
#         except Exception as e:
#             printT()(f"【getCookie Error】{e}")

    # 检测cookie格式是否正确
    def getUserInfo(self, ck, pinName, userNum):
        url = 'https://me-api.jd.com/user_new/info/GetJDUserInfoUnion?orgFlag=JD_PinGou_New&callSource=mainorder&channel=4&isHomewhite=0&sceneval=2&sceneval=2&callback=GetJDUserInfoUnion'
        headers = {
            'Cookie': ck,
            'Accept': '*/*',
            'Connection': 'close',
            'Referer': 'https://home.m.jd.com/myJd/home.action',
            'Accept-Encoding': 'gzip, deflate, br',
            'Host': 'me-api.jd.com',
            'User-Agent': 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.2 Mobile/15E148 Safari/604.1',
            'Accept-Language': 'zh-cn'
        }
        try:
            resp = requests.get(url=url, verify=False, headers=headers, timeout=60).text
            r = re.compile(r'GetJDUserInfoUnion.*?\((.*?)\)')
            result = r.findall(resp)
            userInfo = json.loads(result[0])
            nickname = userInfo['data']['userInfo']['baseInfo']['nickname']
            return ck, nickname
        except Exception:
            context = f"账号{userNum}【{pinName}】Cookie 已失效！请重新获取。"
            printT(context)
            return ck, False

    def iscookie(self):
        """
        :return: cookiesList,userNameList,pinNameList
        """
        cookiesList = []
        userNameList = []
        pinNameList = []
        if 'pt_key=' in cookies and 'pt_pin=' in cookies:
            r = re.compile(r"pt_key=.*?pt_pin=.*?;", re.M | re.S | re.I)
            result = r.findall(cookies)
            if len(result) >= 1:
                printT("您已配置{}个账号".format(len(result)))
                u = 1
                for i in result:
                    r = re.compile(r"pt_pin=(.*?);")
                    pinName = r.findall(i)
                    pinName = unquote(pinName[0])
                    # 获取账号名
                    ck, nickname = self.getUserInfo(i, pinName, u)
                    if nickname != False:
                        cookiesList.append(ck)
                        userNameList.append(nickname)
                        pinNameList.append(pinName)
                    else:
                        u += 1
                        continue
                    u += 1
                if len(cookiesList) > 0 and len(userNameList) > 0:
                    return cookiesList, userNameList, pinNameList
                else:
                    printT("没有可用Cookie，已退出")
                    exit(3)
            else:
                printT("cookie 格式错误！...本次操作已退出")
                exit(4)
        else:
            printT("cookie 格式错误！...本次操作已退出")
            exit(4)
getCk = getJDCookie()
#getCk.getCookie()

# 获取v4环境 特殊处理
try:
    with open(v4f, 'r', encoding='utf-8') as v4f:
        v4Env = v4f.read()
    r = re.compile(r'^export\s(.*?)=[\'\"]?([\w\.\-@#&=_,\[\]\{\}\(\)]{1,})+[\'\"]{0,1}$',
                   re.M | re.S | re.I)
    r = r.findall(v4Env)
    curenv = locals()
    for i in r:
        if i[0] != 'JD_COOKIE':
            curenv[i[0]] = getEnvs(i[1])
except:
    pass

##############      在pycharm测试ql环境用，实际用下面的代码运行      #########
# with open(path, "r+", encoding="utf-8") as f:
#     ck = f.read()
#     if "JD_COOKIE" in ck:
#         # r = re.compile (r"pt_key=.*?pt_pin=.*?;", re.M | re.S | re.I)
#         # cookies = r.findall (ck)
#         # cookies = cookies[0]
#         # print(cookies)
#         cookies = ck
#         printT ("已获取并使用ck环境 Cookie")
########################################################################


if "JD_COOKIE" in os.environ:
    if len (os.environ["JD_COOKIE"]) > 1:
        cookies = os.environ["JD_COOKIE"]
        cookies = cookies.split ('&')
        # cookies = temporary[0]
        printT ("已获取并使用Env环境 Cookie")

if "heath_noexchage" in os.environ:
    heath_noexchage = os.environ["heath_noexchage"]
    printT(f"已获取并使用Env环境 heath_noexchage:{heath_noexchage}")

if "least" in os.environ:
    least = getEnvs(os.environ["least"])
    printT(f"已获取并使用Env环境 least:{least}")

if "dd_thread" in os.environ:
    if len (os.environ["dd_thread"]) > 1:
        dd_thread = getEnvs (os.environ["dd_thread"])
        printT(f"已获取并使用Env环境 dd_thread:{dd_thread}")

heath_noexchage_list = heath_noexchage.split('&')

def userAgent():
    """
    随机生成一个UA
    :return: jdapp;iPhone;9.4.8;14.3;xxxx;network/wifi;ADID/201EDE7F-5111-49E8-9F0D-CCF9677CD6FE;supportApplePay/0;hasUPPay/0;hasOCPay/0;model/iPhone13,4;addressid/2455696156;supportBestPay/0;appBuild/167629;jdSupportDarkMode/0;Mozilla/5.0 (iPhone; CPU iPhone OS 14_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148;supportJDSHWK/1
    """
    if not UserAgent:
        uuid = ''.join(random.sample('123456789abcdef123456789abcdef123456789abcdef123456789abcdef', 40))
        addressid = ''.join(random.sample('1234567898647', 10))
        iosVer = ''.join(
            random.sample(["14.5.1", "14.4", "14.3", "14.2", "14.1", "14.0.1", "13.7", "13.1.2", "13.1.1"], 1))
        iosV = iosVer.replace('.', '_')
        iPhone = ''.join(random.sample(["8", "9", "10", "11", "12", "13"], 1))
        ADID = ''.join(random.sample('0987654321ABCDEF', 8)) + '-' + ''.join(
            random.sample('0987654321ABCDEF', 4)) + '-' + ''.join(random.sample('0987654321ABCDEF', 4)) + '-' + ''.join(
            random.sample('0987654321ABCDEF', 4)) + '-' + ''.join(random.sample('0987654321ABCDEF', 12))
        return f'jdapp;iPhone;10.0.4;{iosVer};{uuid};network/wifi;ADID/{ADID};supportApplePay/0;hasUPPay/0;hasOCPay/0;model/iPhone{iPhone},1;addressid/{addressid};supportBestPay/0;appBuild/167629;jdSupportDarkMode/0;Mozilla/5.0 (iPhone; CPU iPhone OS {iosV} like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148;supportJDSHWK/1'
    else:
        return UserAgent

## 获取通知服务
class msg(object):
    def __init__(self, m=''):
        self.str_msg = m
        self.message()
    def message(self):
        global msg_info
        printT(self.str_msg)
        try:
            msg_info = "{}\n{}".format(msg_info, self.str_msg)
        except:
            msg_info = "{}".format(self.str_msg)
        sys.stdout.flush()           #这代码的作用就是刷新缓冲区。
                                     # 当我们打印一些字符时，并不是调用print函数后就立即打印的。一般会先将字符送到缓冲区，然后再打印。
                                     # 这就存在一个问题，如果你想等时间间隔的打印一些字符，但由于缓冲区没满，不会打印。就需要采取一些手段。如每次打印后强行刷新缓冲区。
    def getsendNotify(self, a=0):
        if a == 0:
            a += 1
        try:
            url = 'https://gitee.com/curtinlv/Public/raw/master/sendNotify.py'
            response = requests.get(url)
            if 'curtinlv' in response.text:
                with open('sendNotify.py', "w+", encoding="utf-8") as f:
                    f.write(response.text)
            else:
                if a < 5:
                    a += 1
                    return self.getsendNotify(a)
                else:
                    pass
        except:
            if a < 5:
                a += 1
                return self.getsendNotify(a)
            else:
                pass
    def main(self):
        global send
        cur_path = os.path.abspath(os.path.dirname(__file__))
        sys.path.append(cur_path)
        if os.path.exists(cur_path + "/sendNotify.py"):
            try:
                from sendNotify import send
            except:
                self.getsendNotify()
                try:
                    from sendNotify import send
                except:
                    printT("加载通知服务失败~")
        else:
            self.getsendNotify()
            try:
                from sendNotify import send
            except:
                printT("加载通知服务失败~")
        ###################
msg().main()

class TaskThread(threading.Thread):
    """
    处理task相关的线程类
    """
    def __init__(self, func, args=()):
        super(TaskThread, self).__init__()
        self.func = func  # 要执行的task类型
        self.args = args  # 要传入的参数

    def run(self):
        # 线程类实例调用start()方法将执行run()方法,这里定义具体要做的异步任务
        #print("start func {}".format(self.func.__name__))  # 打印task名字　用方法名.__name__
        self.result = self.func(*self.args)  # 将任务执行结果赋值给self.result变量   前面加*，表示传入多个参数

    def get_result(self):
        # 该方法返回task函数的执行结果,方法名不是非要get_result
        try:
            return self.result
        except Exception as ex:
            print(ex)
            return "ERROR"
def listcookie():             #将JDCookies.txt的cookies变成list[]
    if 'pt_key=' in cookies and 'pt_pin=' in cookies:
        r = re.compile(r"pt_key=.*?pt_pin=.*?;" ,  re.M | re.S | re.I)         #r"" 的作用是去除转义字符.
        result = r.findall(cookies)        #输出为list列表
        if len(result) == 1:
            return result
        elif len(result)>1:
            return result
        else:
            print("cookie 格式错误！...本次操作已退出")
            exit(1)
    else:
        print("cookie 格式错误！...本次操作已退出")
        exit(9)

def setHeaders(cookie):
    try:
        r = re.compile(r"pt_pin=(.*?);")    #指定一个规则：查找pt_pin=与;之前的所有字符,但pt_pin=与;不复制。r"" 的作用是去除转义字符.
        userName = r.findall(cookie)        #查找pt_pin=与;之前的所有字符，并复制给r，其中pt_pin=与;不复制。
        #print (userName)
        userName = unquote(userName[0])     #r.findall(cookie)赋值是list列表，这个赋值为字符串
        #print(userName)
    except Exception as e:
        print(e,"cookie格式有误！")
        exit(2)
    headers = {
        'Origin': 'https://h5.m.jd.com',
        'Cookie': cookie,
        'Connection': 'keep-alive',
        'Accept': 'application/json, text/plain, */*',
        'Referer': 'https://h5.m.jd.com/',
        #'Host': 'ms.jr.jd.com',
        'Content-Type': 'application/x-www-form-urlencoded',
        #'User-Agent': 'jdapp;iPhone;9.4.8;14.3;809409cbd5bb8a0fa8fff41378c1afe91b8075ad;network/wifi;ADID/201EDE7F-5111-49E8-9F0D-CCF9677CD6FE;supportApplePay/0;hasUPPay/0;hasOCPay/0;model/iPhone13,4;addressid/2455696156;supportBestPay/0;appBuild/167629;jdSupportDarkMode/0;Mozilla/5.0 (iPhone; CPU iPhone OS 14_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148;supportJDSHWK/1',
        'User-Agent': userAgent(),
        'Accept-Encoding': 'gzip, deflate, br',
        'Accept-Language': 'zh-cn'
    }
    return headers,userName

#返回符合条件的ck list
def checkUser(cookies):
    global goodsid, mid_time,afternoon_time
    if isinstance(cookies,list):            #isinstance() 函数来判断一个对象是否是一个已知的类型，类似 type()。此方法为：判断cookies是否为list[]列表，是返回True，否返回False
        pass
    elif isinstance(cookies,str):          #判断cookies是否为str字符串，是返回True，否返回False
        cookies = listcookie()
    else:
        print("cookie 类型有误")
        exit(2)
    cookieList=[]
    #print(cookies)
    user_num=1
    for i in cookies:
        headers,userName = setHeaders(i)
        try:
            total_exchangePoints = cheak_points('jdhealth_getTaskDetail','{"buildingId":"","taskId":22,"channelId":1}',headers)
            title,exchangePoints,bizMsg,bizCode = jdhealth_getCommodities('jdhealth_getCommodities','{}',headers)
            if user_num == 1:
                printT("您已设置兑换的商品：【{0}豆】 需要{1}积分".format(title, exchangePoints))
                print("********** 首先检测您是否有钱呀 ********** ")
            if str(total_exchangePoints) > least:
                total_exchangePoints = int(total_exchangePoints)
                if not str(user_num) in heath_noexchage_list:
                    cookieList.append(i)            #将够钱兑换的账号保存下来给cookieList[]，其余不够钱的账号剔除在外，不执行兑换
                    printT(f"账号{user_num}:【{userName}】积分:{total_exchangePoints}...yes")
            else:
                total_exchangePoints = int (total_exchangePoints)
                printT(f"账号{user_num}:【{userName}】积分:{total_exchangePoints}...no")
        except Exception as e:
            #printT(f"账号{user_num}:【{userName}】，该用户异常，查不到商品关键词【{Coupon}】，或者cookies已过期")
            msg(f"账号{user_num}:【{userName}】，该用户异常，查不到商品id【{id}】")
            # if '异常' in msg_info:
            #     send (script_name, msg_info)
            #     if len (cookies) == 1:
            #exit (0)
        user_num+=1
    if len (cookieList) > 0:
        printT ("共有{0}个账号符合兑换条件".format (len (cookieList)))
        return cookieList
    else:
        printT ("没有账号符合兑换要求，退出执行")
        exit(0)
#查询总分
def cheak_points(functionId,body,headers):
    url = jd_host + '?' +'functionId=' + functionId + '&body=' + body + '&client=wh5&clientVersion=1.0.0&' + 'uuid=' + uuid
    try:
        respon = requests.post(url=url, verify=False, headers=headers)
        result=respon.json()
        #print(result)
        total_exchangePoints = result['data']['result']['userScore']   #兑换所需分数
        return float(total_exchangePoints)
    except Exception as e:
            print(e)

#查询
def jdhealth_getCommodities(functionId,body,headers):
    url = jd_host + '?' +'functionId=' + functionId + '&body=' + body + '&client=wh5&clientVersion=1.0.0&' + 'uuid=' + uuid
    try:
        respon = requests.post(url=url, verify=False, headers=headers)
        result=respon.json()
        title = result['data']['result']['jBeans'][3]['title']
        exchangePoints = result['data']['result']['jBeans'][3]['exchangePoints']    #兑换所需分数
        bizMsg = result['data']['bizMsg']
        bizCode = result['data']['bizCode']
        return title,exchangePoints,bizMsg,bizCode
    except Exception as e:
            print(e)

#兑换
def jdhealth_exchange(functionId,body,headers):
    url = jd_host + '?' +'functionId=' + functionId + '&body=' + body + '&client=wh5&clientVersion=1.0.0&' + 'uuid=' + uuid
    try:
        respon = requests.post(url=url, verify=False, headers=headers)
        result=respon.json()
        #title = result['data']['result']['jingBeanNum']
        #userScore = result['data']['result']['userScore']           #剩余积分
        bizMsg = result['data']['bizMsg']
        bizCode = result['data']['bizCode']
        success = result['data']['success']
        if bizMsg == 'success' or bizCode == '0' :
                printT("{0}...恭喜兑换成功！".format(bizMsg))
                return 0
        else:
            printT(f"\t{bizMsg}" + ',兑换失败')          #f 表达式----可以解析任意的数据类型。      \t表示空4格，相当于tab。
            return 999
    except Exception as e:
            print(e)

def start():
    print (f"###### 启动并发线程 【Thread-{dd_thread}】")
    # cookiesList, userNameList, pinNameList = getCk.iscookie ()
    # cookies1 = checkUser (cookiesList)  # 将够钱兑换的账号保存下来给cookies，其余不够钱的账号剔除在外，不执行兑换
    final = 1
    while True:
        print (f"\n【准备开始...】\n")
        user_num = 1
        for i in cookies:
            headers, userName = setHeaders (i)
            final = jdhealth_exchange ('jdhealth_exchange','{"commodityType":2,"commodityId":"4"}',headers)
            user_num += 1
            if final == 0:
                last_points = cheak_points ('jdhealth_getTaskDetail','{"buildingId":"","taskId":22,"channelId":1}',headers)
                title, exchangePoints, bizMsg, bizCode = jdhealth_getCommodities ('jdhealth_getCommodities', '{}',headers)
                # printT (f"账号{user_num}:【{userName}】剩余积分:{last_integration}...")
                msg (f"账号{user_num}:【{userName}】成功兑换【{title}豆】，剩余积分:{last_points}...")

            elif final == 999:
                pass
        if user_num > len(cookies):
            break
if __name__ == '__main__':
    print("脚本默认兑换20豆，18W分以上才兑换，具体修改教程可看脚本开头注释")
    print ("\t\t【{}】".format (script_name))
    start ()
    if '成功兑换' in msg_info:
        send (script_name, msg_info)
