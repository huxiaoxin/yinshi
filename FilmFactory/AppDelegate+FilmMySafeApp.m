//
//  AppDelegate+FilmMySafeApp.m
//  FilmFactory
//
//  Created by codehzx on 2021/4/25.
//

#import "AppDelegate+FilmMySafeApp.h"
#import "FilmFactortLoactionModel.h"
#import "FilmFactoryZoneModel.h"
#import <WHC_ModelSqliteKit-umbrella.h>
#import "FilmFactoryComentModel.h"
@implementation AppDelegate (FilmMySafeApp)
+(void)load{
    [self FilmFactortLoactionModelConfig];
    [self FilmFactoryZoneModelConfig];
    [self FilmFactoryComentModelConfig];
}
+(void)FilmFactoryZoneModelConfig{
    NSMutableArray * tempArr = [NSMutableArray array];
    
    FilmFactoryZoneModel * zoneModel=  [[FilmFactoryZoneModel alloc]init];
    zoneModel.SectionID = 0;
    zoneModel.name = @"犄角掉了";
    zoneModel.times  =@"13:29";
    zoneModel.userImgIcon = @"https://img2.doubanio.com/icon/up230533267-3.jpg";
    zoneModel.imgThuburls = @[@"https://img1.doubanio.com/view/group_topic/l/public/p427201648.jpg",@"https://img1.doubanio.com/view/group_topic/l/public/p427359159.jpg"];
    zoneModel.title = @"因为小抄做的太艺术被老师们发群里争相传阅，把我...";
    zoneModel.detail = @"可把我牛逼坏了，贴的是那么严丝合缝，浑然天成，仿佛它本身就和牛奶盒是一体的，突然感觉有救了，于是我信誓旦旦地放在桌上，今日默写，稳！";
    zoneModel.ZoneDetrailID = 0;
    zoneModel.SectionTime = @"26日 2021年04月";
    [tempArr addObject:zoneModel];
    
    
    FilmFactoryZoneModel * zoneModel1 =  [[FilmFactoryZoneModel alloc]init];
    zoneModel1.SectionID = 0;
    zoneModel1.name = @"pharmaceutical ";
    zoneModel1.times  =@"14:16";
    zoneModel1.userImgIcon = @"https://img3.doubanio.com/icon/u214879397-1.jpg";
    zoneModel1.imgThuburls = @[@"https://img1.doubanio.com/view/group_topic/l/public/p431709168.jpg"];
    zoneModel1.title = @"妹妹说我拼色毛衣是偷的老太太的";
    zoneModel1.detail = @"太难了，我精心搭配了好久，家人们我这是回家了吗 如有不妥立马删！ 谢谢楼里夸我身材还有欢迎我回家的姐妹们🌹🌹🌹，或许可以看一下我进组第一帖：回家穿搭之曲线消失大法 [进组了，火速分享给家人们我的潮流穿...";
    zoneModel1.ZoneDetrailID = 1;
    zoneModel1.SectionTime = @"26日 2021年04月";
    [tempArr addObject:zoneModel1];
    
    
    

    
    FilmFactoryZoneModel * zoneModel2 =  [[FilmFactoryZoneModel alloc]init];
    zoneModel2.SectionID = 1;
    zoneModel2.name = @"阿达 ";
    zoneModel2.times  =@"10:09";
    zoneModel2.userImgIcon = @"https://img2.doubanio.com/icon/u68319765-2.jpg";
    zoneModel2.imgThuburls = @[@"https://img1.doubanio.com/view/note/l/public/p81309838.jpg",@"https://img1.doubanio.com/view/note/l/public/p81310767.jpg",@"https://img1.doubanio.com/view/note/l/public/p81250429.jpg",@"https://img3.doubanio.com/view/note/l/public/p81248260.jpg"];
    zoneModel2.title = @"【寻梦环游记】的剧本为什么那么催泪";
    zoneModel2.detail = @"晚上刷手机刷到了纯音乐版的“Remember Me”，又去找了电影的cut，当时在影院哭的稀里哗啦的感觉再次涌上心头。不禁感叹，【寻梦环游记】（Coco）是这几年上映的最催泪的电影了。";
    zoneModel2.ZoneDetrailID = 2;
    zoneModel2.SectionTime = @"25日 2021年04月";
    [tempArr addObject:zoneModel2];
    
    FilmFactoryZoneModel * zoneModel3 =  [[FilmFactoryZoneModel alloc]init];
    zoneModel3.SectionID = 1;
    zoneModel3.name = @"深焦DeepFocus";
    zoneModel3.times  =@"20:12";
    zoneModel3.userImgIcon = @"https://img9.doubanio.com/icon/u139444387-5.jpg";
    zoneModel3.imgThuburls = @[@"https://img1.doubanio.com/view/note/l/public/p81321997.jpg",@"https://img1.doubanio.com/view/note/l/public/p81321999.jpg",@"https://img3.doubanio.com/view/note/l/public/p81322001.jpg"];
    zoneModel3.title = @"去年法国人把最佳电影，发给了这部忧伤的喜剧";
    zoneModel3.detail = @"《拜拜笨蛋》一片的结尾和很多年前的另一部法国片《两小无猜》有着异曲同工之妙：在喜剧的尽头以死的悲剧终结一切。我们似乎可以以悲喜交集来形容本部作品，甚至可以延伸出一系列溢美之辞。";
    zoneModel3.ZoneDetrailID = 3;
    zoneModel3.SectionTime = @"25日 2021年04月";
    [tempArr addObject:zoneModel3];


    FilmFactoryZoneModel * zoneModel4 =  [[FilmFactoryZoneModel alloc]init];
    zoneModel3.SectionID = 1;
    zoneModel4.name = @"杨多荤";
    zoneModel4.times  =@"19:21";
    zoneModel4.userImgIcon = @"https://img1.doubanio.com/icon/u91740338-17.jpg";
    zoneModel4.imgThuburls = @[@"https://img1.doubanio.com/view/status/l/public/01a595f205dfe3c.jpg",@"https://img3.doubanio.com/view/status/l/public/ce3d6113b31a2a1.jpg"];
    zoneModel4.title = @"电影中充满爱意的眼神";
    zoneModel4.detail = @"看《波斯语课》想要触碰却收回的手，想到了《爱在》中同样的情节。小心翼翼地爱着对方，如同时间的密语。";
    zoneModel4.ZoneDetrailID = 4;
    zoneModel4.SectionTime = @"25日 2021年04月";
    [tempArr addObject:zoneModel4];

    
    
    FilmFactoryZoneModel * zoneModel5 =  [[FilmFactoryZoneModel alloc]init];
    zoneModel5.SectionID = 2;
    zoneModel5.name = @"木下惠介";
    zoneModel5.times  =@"22:19";
    zoneModel5.userImgIcon = @"https://img9.doubanio.com/icon/u162245631-95.jpg";
    zoneModel5.imgThuburls = @[@"https://img1.doubanio.com/view/status/l/public/0cb346e0f49496a.jpg",@"https://img2.doubanio.com/view/status/l/public/28f1ac20bd97c7f.jpg",@"https://img3.doubanio.com/view/status/l/public/66c3912a7c2c7de.jpg"];
    zoneModel5.title = @"影视作品中的氛围感美人";
    zoneModel5.detail = @"一辈子要有一张这样的照片就好了。她区别于你周围 10 公里以内任何一个人";
    zoneModel5.ZoneDetrailID = 5;
    zoneModel5.SectionTime = @"23日 2021年04月";
    [tempArr addObject:zoneModel5];
    
    
    FilmFactoryZoneModel * zoneModel6 =  [[FilmFactoryZoneModel alloc]init];
    zoneModel6.SectionID = 2;
    zoneModel6.name = @"BeateZ ";
    zoneModel6.times  =@"14:26";
    zoneModel6.userImgIcon = @"https://img2.doubanio.com/icon/u136169341-2.jpg";
    zoneModel6.imgThuburls = @[@"https://img3.doubanio.com/view/status/l/public/3f82f2005a3499e.jpg",@"https://img9.doubanio.com/view/status/l/public/8db7632fd68d945.jpg",@"https://img9.doubanio.com/view/status/l/public/d310960de41f7f6.jpg"];
    zoneModel6.title = @"影视作品中的氛围感美人";
    zoneModel6.detail = @"《大汉天子》王灵饰卫子夫。“心如水晶颜如玉，不与群芳争短长。”正如话题描述所说，无论是对剧中的少年刘彻还是电视机前的观众而言，她的美不是凸显出来的，而是一点一点进入到人心里的。";
    zoneModel6.ZoneDetrailID = 6;
    zoneModel6.SectionTime = @"23日 2021年04月";
    [tempArr addObject:zoneModel6];

    
    
    
    
    BOOL FilmmzoneStat = [[NSUserDefaults standardUserDefaults] boolForKey:@"FilmFaoctZone"];
    if (FilmmzoneStat == NO) {
        BOOL FilmFaoctZone = [WHC_ModelSqlite inserts:tempArr.copy];
        [[NSUserDefaults standardUserDefaults] setBool:FilmFaoctZone forKey:@"FilmFaoctZone"];
        [[NSUserDefaults standardUserDefaults] synchronize];

    }
}
+(void)FilmFactoryComentModelConfig
{
    NSMutableArray * tempArr = [NSMutableArray array];
    
    FilmFactoryComentModel * comentmdoel = [[FilmFactoryComentModel alloc]init];
    comentmdoel.imgurl = @"https://img3.doubanio.com/icon/u179906573-21.jpg";
    comentmdoel.name = @"sarabi";
    comentmdoel.time = @"14:21";
    comentmdoel.content = @"你这个缩印做的真心牛逼";
    comentmdoel.ZoneID = 0;
    comentmdoel.ComentID = 0;
    comentmdoel.CellHeight = 0;
    [tempArr addObject:comentmdoel];
    
    
    FilmFactoryComentModel * comentmdoel1 = [[FilmFactoryComentModel alloc]init];
    comentmdoel1.imgurl = @"https://img2.doubanio.com/icon/u189337709-2.jpg";
    comentmdoel1.name = @"流水无形_LC ";
    comentmdoel1.time = @"14:45";
    comentmdoel1.content = @"下次参考牛奶盒上配料表的格式排版试试";
    comentmdoel1.ZoneID = 0;
    comentmdoel1.ComentID = 1;
    comentmdoel1.CellHeight = 0;
    [tempArr addObject:comentmdoel1];

    
    FilmFactoryComentModel * comentmdoel2 = [[FilmFactoryComentModel alloc]init];
    comentmdoel2.imgurl = @"https://img2.doubanio.com/icon/u215816664-2.jpg";
    comentmdoel2.name = @"人类行为研究员 ";
    comentmdoel2.time = @"14:45";
    comentmdoel2.content = @"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈但凡lz能花干这个十分之一的心思背课文还至于默写不出吗🐒";
    comentmdoel2.ZoneID = 0;
    comentmdoel2.ComentID = 2;
    comentmdoel2.CellHeight = 0;
    [tempArr addObject:comentmdoel2];

    
    FilmFactoryComentModel * comentmdoel3 = [[FilmFactoryComentModel alloc]init];
    comentmdoel3.imgurl = @"https://img3.doubanio.com/icon/u195964764-20.jpg";
    comentmdoel3.name = @"我才不是江湖骗子 ";
    comentmdoel3.time = @"16:21";
    comentmdoel3.content = @"家人 我觉得这件很像泳衣 虽然是毛衣但我感受到了一丝清凉";
    comentmdoel3.ZoneID = 1;
    comentmdoel3.ComentID = 3;
    comentmdoel3.CellHeight = 0;
    [tempArr addObject:comentmdoel3];

    FilmFactoryComentModel * comentmdoel4 = [[FilmFactoryComentModel alloc]init];
    comentmdoel4.imgurl = @"https://img2.doubanio.com/icon/u196826257-2.jpg";
    comentmdoel4.name = @"王夫之  ";
    comentmdoel4.time = @"16:52";
    comentmdoel4.content = @"毛衣质感不够颜色饱和度低，慎用毛衣深色拼色哈哈";
    comentmdoel4.ZoneID = 1;
    comentmdoel4.ComentID = 4;
    comentmdoel4.CellHeight = 0;
    [tempArr addObject:comentmdoel4];
    
    FilmFactoryComentModel * comentmdoel5 = [[FilmFactoryComentModel alloc]init];
    comentmdoel5.imgurl = @"https://img2.doubanio.com/icon/u68319765-2.jpg";
    comentmdoel5.name = @"阿达";
    comentmdoel5.time = @"18:12";
    comentmdoel5.content = @"当我们谈论电影时，“催泪”似乎是有些廉价，甚至略带贬义的形容词";
    comentmdoel5.ZoneID = 2;
    comentmdoel5.ComentID = 5;
    comentmdoel5.CellHeight = 0;
    [tempArr addObject:comentmdoel5];
    
    
    FilmFactoryComentModel * comentmdoel6 = [[FilmFactoryComentModel alloc]init];
    comentmdoel6.imgurl = @"https://img2.doubanio.com/icon/up169123101-3.jpg";
    comentmdoel6.name = @"夺铎堕";
    comentmdoel6.time = @"22:12";
    comentmdoel6.content = @"“笨蛋”一词在中文中自带嗔怪之感";
    comentmdoel6.ZoneID = 3;
    comentmdoel6.ComentID = 6;
    comentmdoel6.CellHeight = 0;
    [tempArr addObject:comentmdoel6];
    
    
    
    FilmFactoryComentModel * comentmdoel7 = [[FilmFactoryComentModel alloc]init];
    comentmdoel7.imgurl = @"https://img9.doubanio.com/icon/up162245631-95.jpg";
    comentmdoel7.name = @"木下惠介";
    comentmdoel7.time = @"22:20";
    comentmdoel7.content = @"当时这张照片展出，让很多女孩发疯，她们说一辈子要有一张这样的照片就好了。看完这张照片，你会觉得，她区别于你周围 10 公里以内任何一个人。";
    comentmdoel7.ZoneID = 5;
    comentmdoel7.ComentID = 7;
    comentmdoel7.CellHeight = 0;
    [tempArr addObject:comentmdoel7];

    
    

    
    BOOL isSucedComent = [[NSUserDefaults standardUserDefaults] boolForKey:@"isComment"];
    if (isSucedComent == NO) {
        BOOL  isComment =   [WHC_ModelSqlite inserts:tempArr.copy];
         
         [[NSUserDefaults standardUserDefaults] setDouble:isComment forKey:@"isComment"];
         [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
  
    
}
+(void)FilmFactortLoactionModelConfig{
    NSMutableArray * FilmTempArr  =[NSMutableArray array];
    FilmFactortLoactionModel * locationModel =[[FilmFactortLoactionModel alloc]init];
    locationModel.imgArrs = @[@"https://image11.m1905.cn/uploadfile/2021/0422/thumb_1_1380_460_20210422115515830912.jpg",@"https://image11.m1905.cn/uploadfile/2021/0421/20210421100904690123.jpg",@"https://image11.m1905.cn/uploadfile/2021/0421/20210421100807468261.jpg",@"https://image11.m1905.cn/uploadfile/2021/0421/20210421100659458584.jpg"];
    locationModel.FilmThubImgView = @"https://image11.m1905.cn/uploadfile/2021/0422/thumb_1_1380_460_20210422115515830912.jpg";
    locationModel.title = @"9.2分！张艺谋的《悬崖之上》要接棒《风声》？";
    locationModel.titleDesc =@"(谍战片 | 冷峻)";
    locationModel.DetailDesc = @"这部定档五一档的谍战大片还将在映前进行两轮点映，足以看出片方对作品质量充满信心。当然，一切表现还得等电影正式上映后才能见真章。2009年的《风声》开启国产谍战片类型创作的先声，这12年间，谍战片的作品数量并不太多，优秀的谍战片也屈指可数，此次《悬崖之上》能否成功接棒，再造谍战片高峰，是许多观众的期待。 而钩沉影史，国产谍战片作为一种特殊片种，从过去到现在经历的类型变化也值得挖掘、观察。“在中国，谍战电影不多，这次碰到令我心动的剧本，希望能拍出特别感。”第一次接触谍战片的张艺谋选择《悬崖之上》，其实不无道理。";
    locationModel.tageOne = @"悬崖之上";
    locationModel.tagTwo = @"白玉兰奖";
    locationModel.isStart = NO;
    locationModel.isCollted = NO;
    locationModel.colltecdNum =43;
    locationModel.joinTime = @"4/29 12:00:00 至 4/30 12:00:00";
    locationModel.playTime = @"5/1 24:00:00 至 5/2 24:00:00";
    locationModel.loaction = @"北京市东城区王府井大街255号北京市百货大楼F8";
    locationModel.phone = @"(010)65234366";
    locationModel.LoactionID = 0;
    [FilmTempArr addObject:locationModel];
    
    
    FilmFactortLoactionModel * locationModel1 =[[FilmFactortLoactionModel alloc]init];
    locationModel1.imgArrs = @[@"https://image11.m1905.cn/uploadfile/2021/0420/20210420091203793134.jpg",@"https://image11.m1905.cn/uploadfile/2021/0420/20210420091203916952.jpg",@"https://image11.m1905.cn/uploadfile/2021/0420/20210420091203488830.jpg",@"https://image11.m1905.cn/uploadfile/2021/0420/20210420091203662430.jpg"];
    locationModel1.FilmThubImgView = @"https://image11.m1905.cn/uploadfile/2021/0420/20210420091203793134.jpg";
    locationModel1.title = @"盘点革命年代的伟大爱恋：风雨中，这份爱更浪漫";
    locationModel1.titleDesc =@"(谍战片 | 黄建新)";
    locationModel1.DetailDesc = @"电影《1921》在展现波澜壮阔的建党伟大篇章的同时，也将镜头瞄准了这对革命夫妻在往昔峥嵘岁月中那份可贵的真情。二人相互陪伴、扶持，给予彼此继续奋战的力量。在国家存亡之际，李达和王会悟将夫妻小爱化为无穷力量，奉献给国家大爱，相濡以沫、奔赴共同理想的革命伴侣令人敬佩又动容，毛泽东曾盛赞夫妇俩：“你们是真正的人”。百年前，李达作为中国共产党发起组的代表，担起了全力筹办中国共产党第一次全国代表大会的重任，王会悟则担负大会召开的食宿、守卫等工作。可以说，如今已驶向百年光辉征程的中国共产党，其起点“中共一大”离不开李达王会悟夫妻俩同心同力的贡献与守护。";
    locationModel1.tageOne = @"革命夫妻";
    locationModel1.tagTwo = @"共产党";
    locationModel1.isStart = NO;
    locationModel1.isCollted = NO;
    locationModel1.colltecdNum =21;
    locationModel1.joinTime = @"5/20 10:30:00 至 6/30 12:00:00";
    locationModel1.playTime = @"5/5 12:30:00 至 5/7 12:00:00";
    locationModel1.loaction = @"北京市东城区香河园路1号当代MOMA北区T4座";
    locationModel1.phone = @"(010)84388257";
    locationModel1.LoactionID = 1;
    [FilmTempArr addObject:locationModel1];
    
    
    
    FilmFactortLoactionModel * locationModel2 =[[FilmFactortLoactionModel alloc]init];
    locationModel2.imgArrs = @[@"https://image11.m1905.cn/uploadfile/2021/0422/20210422093528960692.jpg",@"https://image11.m1905.cn/uploadfile/2021/0422/20210422093507477089.jpg",@"https://image11.m1905.cn/uploadfile/2021/0422/20210422093512101009.jpg",@"https://image11.m1905.cn/uploadfile/2021/0422/20210422093032561680.jpg"];
    locationModel2.FilmThubImgView = @"https://image11.m1905.cn/uploadfile/2021/0422/20210422093528960692.jpg";
    locationModel2.title = @"解析《真·三国无双》：“魔改”吃力不讨好？";
    locationModel2.titleDesc =@"(游戏迷 | 杜制朗)";
    locationModel2.DetailDesc = @"电影《真·三国无双》将于5月1日登陆五一档，看到这个名字，游戏迷们都坐不住了。因为《真·三国无双》系列游戏最早于2000年发售，陪伴众多“无双粉”玩家20年，以“战场再现”为主题、并通过展现系列概念“一骑当千”的爽快战斗，使玩家深陷在三国无双的魅力之中，而它的首次影视化更是备受游戏迷和影迷期待。";
    locationModel2.tageOne = @"无双粉";
    locationModel2.tagTwo = @"真·三国无双";
    locationModel2.isStart = NO;
    locationModel2.isCollted = NO;
    locationModel2.colltecdNum =39;
    locationModel2.joinTime = @"5/27 11:20:00 至 5/30 10:30:00";
    locationModel2.playTime = @"6/1 10:00:00 至 6/1 24:00:00";
    locationModel2.loaction = @"北京市通州区芙蓉园513号楼2至3层";
    locationModel2.phone = @"(010)80850020";
    locationModel2.LoactionID = 2;
    [FilmTempArr addObject:locationModel2];
    
    
    
    FilmFactortLoactionModel * locationModel3 =[[FilmFactortLoactionModel alloc]init];
    locationModel3.imgArrs = @[@"https://image11.m1905.cn/uploadfile/2021/0420/20210420094136681332.jpg",@"https://image11.m1905.cn/uploadfile/2021/0420/20210420093944505624.jpg"];
    locationModel3.FilmThubImgView = @"https://image11.m1905.cn/uploadfile/2021/0420/20210420094136681332.jpg";
    locationModel3.title = @"《八月未央》遭吐槽 原来小说影视化的秘密在这里";
    locationModel3.titleDesc =@"(原著风格 | 李凯)";
    locationModel3.DetailDesc = @"从目前的票房和口碑来看，电影却未能复制小说的成功。豆瓣3.9分，票房不足5000万，《八月未央》“扑”得很彻底。 网友在热评中写道：“闺蜜反目、小三、车祸、自杀，没想到2021年了，国产片还在拍疼痛青春，还在靠洒狗血圈钱。” 原著作者安妮宝贝也在微博发文：“《八月未央》有诚意靠近原著风格，但是力有不逮，有其明显的局限性。”";
    locationModel3.tageOne = @"安妮宝贝";
    locationModel3.tagTwo = @"";
    locationModel3.isStart = NO;
    locationModel3.isCollted = NO;
    locationModel3.colltecdNum =14;
    locationModel3.joinTime = @"5/1 12:00:00 至 5/5 12:00:00";
    locationModel3.playTime = @"5/8 10:12:00 至 5/15 10:20:00";
    locationModel3.loaction = @"北京市通州区芙蓉园513号楼2至3层";
    locationModel3.phone = @"(010)80850020";
    locationModel3.LoactionID = 3;
    [FilmTempArr addObject:locationModel3];

    
    FilmFactortLoactionModel * locationModel4 =[[FilmFactortLoactionModel alloc]init];
    locationModel4.imgArrs = @[@"https://image11.m1905.cn/uploadfile/2021/0423/20210423114209277070.jpg",@"https://image11.m1905.cn/uploadfile/2021/0423/20210423114209886610.jpg",@"https://image11.m1905.cn/uploadfile/2021/0423/20210423114209328063.jpg",@"https://image11.m1905.cn/uploadfile/2021/0423/20210423114212730912.jpg"];
    locationModel4.FilmThubImgView = @"https://image11.m1905.cn/uploadfile/2021/0423/20210423114209277070.jpg";
    locationModel4.title = @"《追虎擒龙》曝预告、海报 古天乐梁家辉黑白交锋";
    locationModel4.titleDesc = @"(黑社会 | 许悦铭)";
    locationModel4.DetailDesc = @"《追虎擒龙》讲述毒枭“跛豪”（梁家辉 饰）和总华探长徐乐（吴镇宇 饰）联手贪污巨利，反腐先锋陈克（古天乐 饰）、白松安（林家栋 饰）决定不惜一切也要将其绳之以法的故事。电影故事背景发生在上世纪七十年代，那时的香港经济飞速发展，但帮派林立，贪腐盛行，混乱之中涌现出一批极具争议性的人物。王晶导演也在此前的采访中表示香港上世纪六七十年代是英国殖民地警黑的混乱状态，自己正值青少年，了解到很多信息，也觉得这是一个非常棒的戏剧题材，一直想拍出来。风云激荡的大时代让电影得以建立极具冲击力的戏剧冲突，传奇人物你方唱罢我登场，看点十足。";
    locationModel4.tageOne = @"跛豪";
    locationModel4.tagTwo = @"";
    locationModel4.isStart = NO;
    locationModel4.isCollted = NO;
    locationModel4.colltecdNum =45;
    locationModel4.joinTime = @"5/1 12:00:00 至 5/5 12:00:00";
    locationModel4.playTime = @"5/10 12:00:00 至 5/12 112:30:00";
    locationModel4.loaction = @"北京市通州区西海子西塔胡同1号";
    locationModel4.phone = @"(010)80850020";
    locationModel4.LoactionID = 4;
    [FilmTempArr addObject:locationModel4];

    

    
    
    BOOL isLoactionModel  = [[NSUserDefaults standardUserDefaults] boolForKey:@"LoactionModel"];
    if (isLoactionModel == NO) {
        BOOL LoactionModel =  [WHC_ModelSqlite inserts:FilmTempArr.copy];
        [[NSUserDefaults standardUserDefaults] setBool:LoactionModel forKey:@"LoactionModel"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    }
@end
