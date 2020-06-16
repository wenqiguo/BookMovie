/*
 Navicat Premium Data Transfer

 Source Server         : wq
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : bookmovies

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 16/06/2020 17:46:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cinema
-- ----------------------------
DROP TABLE IF EXISTS `cinema`;
CREATE TABLE `cinema`  (
  `cinema_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `cinema_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cinema_adress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cinema_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cinema
-- ----------------------------
INSERT INTO `cinema` VALUES (1, '萤火虫巨幕影城', '卧龙区梅溪路6号（原东方红电影院）');
INSERT INTO `cinema` VALUES (2, '时代华纳巨幕影城', '宛城区长江中路长江新世界4楼');
INSERT INTO `cinema` VALUES (3, '大地影院', '宛城区新华路与人民路交叉口红都时代广场A馆三楼');
INSERT INTO `cinema` VALUES (4, '云阳奥斯卡影城', '南召县云阳镇人民路兴云商场3楼');
INSERT INTO `cinema` VALUES (5, '奥斯卡激光影城', '内乡县城关镇尚都国际二排1楼（邮政广场东）');
INSERT INTO `cinema` VALUES (6, '南阳电影城', '卧龙区梅溪路中段202号（南阳市眼科医院南50米）');
INSERT INTO `cinema` VALUES (7, '烽禾影城', '卧龙区卧龙西路南阳师院西区对面经纬国际广场4楼');
INSERT INTO `cinema` VALUES (8, '奥斯卡影城', '宛城区油田大庆路（原油田文化宫舞厅）');
INSERT INTO `cinema` VALUES (9, '横店院线中视影城', '卧龙区文化北路银基购物中心5楼');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `comment_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `movie_id` bigint(20) NULL DEFAULT NULL,
  `comment_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 1, '希望拍成中国版的复仇者联盟，前有大圣归来，现有哪吒，后面姜子牙，再来个杨戬，真希望多些人物，然后终极一战。想想都觉得过瘾。看好国漫，国漫加油。。。。。', 4, '2020-03-10 11:26:46');
INSERT INTO `comment` VALUES (2, 2, '是因为看完哪吒之魔童降世来的有多少人？', 4, '2020-03-10 11:46:04');
INSERT INTO `comment` VALUES (3, 2, '被延期了吗？超想看我家二胖的', 15, '2020-03-10 11:46:40');
INSERT INTO `comment` VALUES (4, 2, '平安武汉，天佑中华！春天来临时再相逢吧！', 16, '2020-03-10 15:24:27');
INSERT INTO `comment` VALUES (5, 2, '有友情、有正义、有勇敢，有感动，国产精品，这样的片子才适合孩子看！', 19, '2020-03-10 15:24:53');
INSERT INTO `comment` VALUES (6, 2, '华仔（章在山）不是死了吗，不过还挺期待(๑˙ー˙๑)', 20, '2020-03-10 15:25:12');
INSERT INTO `comment` VALUES (7, 2, '“我选择直视恶魔”', 21, '2020-03-10 15:25:34');
INSERT INTO `comment` VALUES (9, 2, '米津玄师我哭了太好听了吧 力挺海兽之子！', 24, '2020-03-10 15:26:36');
INSERT INTO `comment` VALUES (10, 3, '比起《天气之子》，我更期待这部《海兽之子》，我在MV中看到类似于《超体》一样的科幻浪漫', 24, '2020-03-10 15:28:02');
INSERT INTO `comment` VALUES (11, 3, 'KIKO一定要在啊！！笔芯', 23, '2020-03-10 15:28:27');
INSERT INTO `comment` VALUES (12, 3, '看一会儿，马上能猜出结局的影片，最多给7分。', 21, '2020-03-10 15:29:48');
INSERT INTO `comment` VALUES (13, 3, '听说这次要炸整个香港好期待啊！华神顶起！', 20, '2020-03-10 15:30:23');
INSERT INTO `comment` VALUES (14, 3, '场景真没得说，特别好很适合孩子看，大人看的话就感觉情节差了些强行逗乐强行感人，虽然最后我还是哭了……有种疯狂动物城的感觉，希望明年的种种剧情能有创新，看的时候后面有个小屁孩儿还踢凳子***……给影院个差评，10点的电影10点10分才放，10点工作人员还没起床还是咋滴，眼镜也是我们自己找的，醉了', 19, '2020-03-10 15:30:44');
INSERT INTO `comment` VALUES (15, 3, '已撤档。。。', 16, '2020-03-10 15:31:05');
INSERT INTO `comment` VALUES (16, 3, '只看半边脸，海报的闫妮和马思纯好像啊', 15, '2020-03-10 15:31:22');
INSERT INTO `comment` VALUES (17, 4, '看了哪吒的彩蛋过来的，被小哪吒威胁了三次', 4, '2020-03-10 15:33:35');
INSERT INTO `comment` VALUES (18, 4, '非常期待第三部，从第一部泰国到第二部美国剧情的跌宕起伏非常过瘾，再谈谈我的偶像昊然的演技也比以前更加娴熟了。宝宝我也是越来越喜欢了。希望第三部再创辉煌。', 23, '2020-03-10 15:34:46');
INSERT INTO `comment` VALUES (19, 4, '成人动画这些年太多了，《熊出没》电影版是为数不多的院线儿童动画电影。', 19, '2020-03-10 15:35:29');
INSERT INTO `comment` VALUES (20, 4, '引进内地啦～求与北美同步定档', 16, '2020-03-10 15:36:18');
INSERT INTO `comment` VALUES (21, 22, '王者农药里面的姜子牙么？', 4, '2020-03-10 15:37:45');
INSERT INTO `comment` VALUES (22, 22, '这是什么神仙阵容，西尔莎·罗南、艾玛·沃森、梅丽尔·史翠普、甜茶…天呐，这一定要看！！！', 16, '2020-03-10 15:38:51');
INSERT INTO `comment` VALUES (23, 23, '期待能带来比哪吒更强的效果', 4, '2020-03-10 15:43:05');
INSERT INTO `comment` VALUES (24, 23, '看见它们俩，就感觉像是少年派电影，就是妙妙去了大学住了的样子', 15, '2020-03-10 15:43:42');
INSERT INTO `comment` VALUES (25, 23, '只说圣诞节北美上映？国内呢。这个颜值真的可', 16, '2020-03-10 15:44:17');
INSERT INTO `comment` VALUES (26, 23, '3D效果比我想象的要好，下雪的时候我以为雪花在我眼前，故事其实很简单，开心的准则开开心心必须的', 19, '2020-03-10 15:45:15');
INSERT INTO `comment` VALUES (27, 23, '期待，期待，期待！重要的事情说三遍！那是相当的期待！', 20, '2020-03-10 15:45:56');
INSERT INTO `comment` VALUES (28, 23, '看过几部同类型的影片，没有太出彩，也还可以吧', 21, '2020-03-10 15:46:13');
INSERT INTO `comment` VALUES (29, 23, '我一直以为是19年大年初一上映呢，结果是20年，还要再等一年吗？我哭辽', 23, '2020-03-10 15:46:58');
INSERT INTO `comment` VALUES (30, 23, '有原作漫画做保证故事应该不会差，音乐有久石让坐镇。另外MV真的震撼到我了，米津玄师亲自为主题曲操刀看得出制作组很用心。 问题是这个导演之前一直在搞哆啦A梦，很疑惑他能不能把控住这种题材。', 24, '2020-03-10 15:47:26');
INSERT INTO `comment` VALUES (31, 24, '非常期待这部电影，第一部炸海底隧道，第二部炸什么呢，非常期待', 20, '2020-03-10 15:49:10');
INSERT INTO `comment` VALUES (32, 24, '黄景瑜 说:“在外面呆久了，已经分不清，哪里是家乡，哪里是远方，”是啊，人们总会因为这些那些的羁绊，而忘记初心，忘记自己努力的方向，小人物吴风一直坚守自己的初心，即使遭遇挫败也要出人头地，这是属于我们的故事，#电影荞麦疯长#', 22, '2020-03-10 15:51:15');
INSERT INTO `comment` VALUES (33, 24, '有点吓人，胆小勿入。。。。', 33, '2020-03-10 15:51:56');
INSERT INTO `comment` VALUES (34, 24, '太感人了，呜呜呜！！', 31, '2020-03-10 15:52:17');
INSERT INTO `comment` VALUES (35, 24, '大娟的声音好好听啊！期待期待，微笑脸。', 28, '2020-03-10 15:53:02');
INSERT INTO `comment` VALUES (36, 24, '你大哥永远是你大哥', 26, '2020-03-10 15:53:27');
INSERT INTO `comment` VALUES (37, 25, '最帅的华仔~~', 20, '2020-03-10 15:55:06');
INSERT INTO `comment` VALUES (38, 25, '为魏晨打call 期待这部电影', 25, '2020-03-10 15:56:26');
INSERT INTO `comment` VALUES (39, 25, '麦兜系列电影，都是无厘头的台词，呆呆笨笨的角色，但是传递的永远都是对于生活的热情和来自家人的关爱。麦太始终支持着麦兜，无论它的梦想有多么不切实际，最终证明，怀揣着梦想的麦兜，始终没有放弃理想。有家有爱有麦太，麦兜响当当，永远不散场的爱！', 30, '2020-03-10 15:57:26');
INSERT INTO `comment` VALUES (40, 25, '我也不忍心看，狗狗太可怜了，那个断了一只腿还向前跑的镜头我害怕是真的做到了！我记得我以前看过一个东西上面说有一个电影情节里面有一只也是这种搜救犬，为了镜头的需要是真的是身上绑了炸弹还是怎么样反正就是直接被炸死的四分五裂emmmmm狗狗不会说话但是他很尽责', 31, '2020-03-10 15:58:19');
INSERT INTO `comment` VALUES (41, 25, '男女主挺登对啊 一门手艺真是在哪儿都有饭吃 疯狂印度和印度制造英文差一个字母 细想含义好像也没天差地别 结尾理想化了点 皆大欢喜又有谁不爱看呢', 32, '2020-03-10 15:58:55');
INSERT INTO `comment` VALUES (42, 25, '过去已去，荞麦疯长；未来已来，你们无需躲藏。吴风你好，黄景瑜你好。', 22, '2020-03-10 15:59:37');
INSERT INTO `comment` VALUES (43, 26, '雲蕎更像普通的我們，在人生道路上一直奔走，總想有一天能活出精彩，但又發現生活更多是平淡如水。她或許不出眾，但卻能引起我的共鳴！', 22, '2020-03-10 16:02:43');
INSERT INTO `comment` VALUES (44, 26, '第一部非常好看！第二部场面更大，剧情更有吸引力，非常期待！', 20, '2020-03-10 16:03:31');
INSERT INTO `comment` VALUES (45, 4, '希望比第一部更震撼！支持华仔！', 20, '2020-03-10 16:04:11');
INSERT INTO `comment` VALUES (46, 22, '超级好看！强烈推荐！', 20, '2020-03-10 16:04:45');
INSERT INTO `comment` VALUES (47, 1, '是潘乘风不是章在山了', 20, '2020-03-10 16:06:52');
INSERT INTO `comment` VALUES (49, 8, '倪妮真的有气质，这女的太A了', 20, '2020-03-10 16:09:59');
INSERT INTO `comment` VALUES (50, 8, '刘昊然！刘昊然！刘昊然！ 秦风！秦风！秦风！ 来自刘昊然小迷妹的期待', 23, '2020-03-10 16:17:56');
INSERT INTO `comment` VALUES (51, 8, '没有以前的好看，没多少笑点，感觉一场看下来平淡无奇，不好看。', 19, '2020-03-10 16:18:36');
INSERT INTO `comment` VALUES (53, 27, '期待新一部动漫，爱了爱了', 24, '2020-04-23 10:38:55');

-- ----------------------------
-- Table structure for hall
-- ----------------------------
DROP TABLE IF EXISTS `hall`;
CREATE TABLE `hall`  (
  `hall_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hall_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cinema_id` bigint(20) NULL DEFAULT NULL,
  `hall_capacity` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`hall_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hall
-- ----------------------------
INSERT INTO `hall` VALUES (1, '1号厅', 1, 144);
INSERT INTO `hall` VALUES (2, '2号厅', 1, 144);
INSERT INTO `hall` VALUES (3, '3号厅', 1, 144);
INSERT INTO `hall` VALUES (4, 'IMAX厅', 1, 144);
INSERT INTO `hall` VALUES (5, '1号厅', 2, 144);
INSERT INTO `hall` VALUES (6, '2号厅', 2, 144);
INSERT INTO `hall` VALUES (7, '3号厅', 2, 144);
INSERT INTO `hall` VALUES (8, 'IMAX厅', 2, 144);
INSERT INTO `hall` VALUES (9, '1号厅', 3, 144);
INSERT INTO `hall` VALUES (10, '2号厅', 3, 144);
INSERT INTO `hall` VALUES (11, '3号厅', 3, 144);
INSERT INTO `hall` VALUES (12, 'IMAX厅', 3, 144);
INSERT INTO `hall` VALUES (13, '1号厅', 4, 144);
INSERT INTO `hall` VALUES (14, '2号厅', 4, 144);
INSERT INTO `hall` VALUES (15, '3号厅', 4, 144);
INSERT INTO `hall` VALUES (16, 'IMAX厅', 4, 144);
INSERT INTO `hall` VALUES (17, '1号厅', 5, 144);
INSERT INTO `hall` VALUES (18, '2号厅', 5, 144);
INSERT INTO `hall` VALUES (19, '3号厅', 5, 144);
INSERT INTO `hall` VALUES (20, 'IMAX号厅', 5, 144);
INSERT INTO `hall` VALUES (21, '1号厅', 6, 144);
INSERT INTO `hall` VALUES (22, '2号厅', 6, 144);
INSERT INTO `hall` VALUES (23, '3号厅', 6, 144);
INSERT INTO `hall` VALUES (24, 'IMAX号厅', 6, 144);
INSERT INTO `hall` VALUES (25, '1号厅', 7, 144);
INSERT INTO `hall` VALUES (26, '2号厅', 7, 144);
INSERT INTO `hall` VALUES (27, '3号厅', 7, 144);
INSERT INTO `hall` VALUES (28, 'IMAX厅', 7, 144);
INSERT INTO `hall` VALUES (29, '1号厅', 8, 144);
INSERT INTO `hall` VALUES (30, '2号厅', 8, 144);
INSERT INTO `hall` VALUES (31, '3号厅', 8, 144);
INSERT INTO `hall` VALUES (32, 'IMAX厅', 8, 144);
INSERT INTO `hall` VALUES (33, '1号厅', 9, 144);
INSERT INTO `hall` VALUES (34, '2号厅', 9, 144);
INSERT INTO `hall` VALUES (35, '3号厅', 9, 144);

-- ----------------------------
-- Table structure for movie
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie`  (
  `movie_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `movie_cname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `movie_fname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `movie_actor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `movie_director` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `movie_detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `movie_duration` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `movie_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `movie_score` double(10, 1) NULL DEFAULT NULL,
  `movie_totalTicket` int(10) NULL DEFAULT NULL,
  `movie_commentCount` bigint(20) NULL DEFAULT NULL,
  `movie_putDate` datetime(0) NULL DEFAULT NULL,
  `movie_country` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `movie_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `movie_state` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`movie_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movie
-- ----------------------------
INSERT INTO `movie` VALUES (4, '姜子牙', 'JIANG ZIYA：Legend Of Deification', '郑希:姜子牙,杨凝:小九', '程鹏', '昆仑弟子姜子牙（郑希 配音）率领众神伐纣，赢得封神大战胜利。即将受封成为众神之长的他，却因一时过失引得昆仑大乱，从此被贬北海，为世人所唾弃。十年后，因一个契机，姜子牙踏上重回昆仑的旅途。在战后的废墟之上，他重新找到自我，也洞悉了十年前的一切真相。', '120分钟', '动画，动作，冒险', 9.2, 5375, NULL, '2020-03-01 00:00:00', '中国大陆', 'static/static/movies/姜子牙/picture/1583116201690.jpg', 1);
INSERT INTO `movie` VALUES (15, '玩命三日', 'At Last', '张嘉译:汪野,闫妮:谭雅文', '刘仪伟', '汪野和谭雅文结婚五年，却一直没有孩子，人到中年的他们决定一定要在今年生一个孩子。两人听从医生的建议，来到澳洲旅行，好转换心情更好受孕，却不成想两人去却走错房间，被前来接头的澳洲黑帮误以为他们就是卖画的人。夫妻二人和黑帮周旋的同时，认识了真正的卖画者露西娅，三人一起结伴而行，在同黑帮斗智斗勇的同时，却也在向一个巨大的阴谋慢慢走近……', '106分钟', '喜剧，爱情，动作', 7.8, 1430, NULL, '2019-12-02 00:00:00', '中国大陆', 'static/static/movies/玩命三日/picture/1583117677939.jpg', 1);
INSERT INTO `movie` VALUES (16, '小妇人', 'Little Women', '罗南:Jo March,沃特森:Meg March', '格蕾塔', '马奇夫人和四个多才多艺但性格各异的女儿一起过着平凡又温馨的生活。梅格贤惠温柔，是为爱痴狂的浪漫主义者；贝丝聪慧娴静，擅长钢琴；艾米年纪最小，有漂亮的外表和现实的头脑；而最特立独行的是乔，她有些男孩子气，热爱写作，在女孩都以嫁人为目标的年代，她立志成为一名独立女性。富有又帅气的青年劳里和乔青梅竹马两小无猜，对乔一见钟情，但乔面对劳里的表白却心烦意乱，决定独自前往纽约追求写作事业。经历了现实的洗礼后，乔逐渐明白了自己对于劳里的心意，却发现劳里即将迎娶妹妹艾米……', '135分钟', '爱情 剧情', 6.9, 2580, NULL, '2020-03-03 00:00:00', '美国', 'static/static/movies/小妇人/picture/1583118018195.jpg', 1);
INSERT INTO `movie` VALUES (19, '熊出没·狂野大陆', 'Boonie Bears:The Wild Life', '张秉君:熊二,谭笑:光头强', '丁亮', '一场起源于爱的冒险！狗熊岭附近新开业了一个神奇的“狂野大陆”，在那里，通过基因技术人可以自由变身各种动物，享受无比的自由和快乐。导游事业受挫的光头强，阴差阳错与神秘人乐天和熊二组队，参加乐园里奖金丰厚的比赛，却遭遇了队友乐天的背叛，历尽艰险终于获得冠军之际，却意外发现狂野大陆中出现了肆意袭击他人的混合变身怪兽，同时也明白了队友乐天窃取基因手环的背后的真相。', '99分钟', '喜剧，科幻，动画', 9.1, 3410, NULL, '2020-03-04 00:00:00', '中国大陆', 'static/static/movies/熊出没·狂野大陆/picture/1583326379215.jpg', 1);
INSERT INTO `movie` VALUES (20, '拆弹专家2', 'Shock Wave 2', '刘德华:潘成凤,刘青云:董卓文,倪妮:庞玲', '邱礼涛', '香港某处发生爆炸案，前拆弹专家潘乘风（刘德华 饰）因昏迷于现场，被警方怀疑牵涉其中。苏醒后的潘乘风记忆缺损，只能一边逃亡一边查明真相，然而，他的好友董卓文（刘青云 饰）和他的前女友庞玲（倪妮 饰）却给他讲述了一段截然不同的回忆。有计划的爆炸案接二连三发生，真相却越来越扑朔迷离……', '120分钟', '动作，犯罪', 7.8, 4200, NULL, '2020-03-04 00:00:00', '中国大陆', 'static/static/movies/拆弹专家2/picture/1583326913965.jpg', 1);
INSERT INTO `movie` VALUES (21, '21座桥', '21 Bridges', '詹弗妮·维纳:NYPD Officer', '布莱恩·柯克', '博斯曼饰一个蒙羞的纽约警局警探，因为被卷入一场全城范围的追捕某警察杀手的行动，获得了赎罪机会——他发现了一起巨大的阴谋：自己的警察同事可能跟一个犯罪帝国有关联。', '99分钟', '惊悚,犯罪', 6.1, 3720, NULL, '2020-03-06 00:00:00', '美国', 'static/static/movies/21座桥/picture/1583327960275.jpg', 1);
INSERT INTO `movie` VALUES (22, '荞麦疯长', 'Wild Grass', '马思纯:云荞,钟楚曦:李麦', '徐展雄', '影片讲述了初入社会的两个女孩和一个男孩在追求新生活的过程中所经历的不可思议的命运考验。他们在蓬勃发展的90年代，与梦想一同升腾幻灭，又绝处逢生。', '120分钟', '爱情，剧情', 8.7, 0, NULL, '2020-04-17 00:00:00', '中国大陆', 'static/static/movies/荞麦疯长/picture/1583328605890.jpg', 0);
INSERT INTO `movie` VALUES (23, '唐人街探案3', 'Detective Chinatown 3', '王宝强:唐仁,刘昊然:秦风', '陈思诚', '继曼谷、纽约之后，东京再出大案。唐人街神探唐仁（王宝强 饰）、秦风（刘昊然 饰）受侦探野田昊（妻夫木聪 饰）的邀请前往破案。“CRIMASTER世界侦探排行榜”中的侦探们闻讯后也齐聚东京，加入挑战，而排名第一Q的现身，让这个大案更加扑朔迷离，一场亚洲最强神探之间的较量即将爆笑展开……', '135分钟', '喜剧，动作，悬疑', 9.1, 5210, NULL, '2020-03-11 00:00:00', '中国大陆', 'static/static/movies/唐人街探案3/picture/1583329370558.jpg', 1);
INSERT INTO `movie` VALUES (24, '海兽之子', '海獣の子供', '芦田爱菜:安海琉花,浦上晟周:空', '渡边步', '偶遇到神秘少年“海”（石桥阳彩 配音）和“空”（浦上晟周 配音）的这个炎炎夏天，是琉花（芦田爱菜 配音）暑期的正式开始。天真无邪的“海”，看透一切的“空”，海洋馆里发光的鱼群，对琉花来说都像是一场浪漫的约定如期而至。', '112分钟', '动画，科幻', 7.9, 6510, NULL, '2020-03-08 00:00:00', '日本', 'static/static/movies/海兽之子/picture/1583329860040.jpg', 1);
INSERT INTO `movie` VALUES (25, '八佰', 'The Eight Hundred', '姜武:老铁,张译:老算盘,王千源:羊拐', '管虎', '1937年淞沪会战末期，国民革命军第88师524团留守上海四行仓库，与租界一河之隔，孤军奋战4昼夜，造就了罕见的被围观的战争；为壮声势，四百人对外号称八百人。 电影《八佰》由管虎导演，是亚洲首部全片使用IMAX摄影机拍摄的商业影片，将于2020年全国上映。', '165分钟', '剧情 战争 历史', 7.6, 0, NULL, '2020-03-21 00:00:00', '中国大陆', 'static/static/movies/八佰/picture/1583331937552.jpg', 0);
INSERT INTO `movie` VALUES (26, '急先锋', 'Vanguard', '成龙:唐焕庭,杨洋:雷震宇', '唐季礼', '中国商人秦国立在英国惨遭雇佣兵组织“北极狼”绑架，秦的女儿Fareeda（徐若晗 饰）也卷入其中，遭到追杀。千钧一发之际，急先锋国际安保团队成为他们唯一的希望，由总指挥唐焕庭（成龙饰）带领雷震宇（杨洋饰）、张凯旋（艾伦饰）、弥雅（母其弥雅饰）、神雕（朱正廷饰）等组成的急先锋行动小组，上天入地，辗转全球各地施展惊险营救。解救人质的过程中，竟发现“北极狼”背后的犯罪集团还策划了一场惊天密谋……', '108分钟', '动作，冒险，喜剧', 7.8, 0, NULL, '2020-03-10 00:00:00', '中国大陆', 'static/static/movies/急先锋/picture/1583716008468.jpg', 0);
INSERT INTO `movie` VALUES (27, '乔乔的异想世界', 'Jojo Rabbit', '罗曼•格里芬•戴:乔乔,托马辛•麦肯齐:艾尔莎', '塔伊加•维迪提', '二战时期，男孩乔乔（罗曼·格里芬·戴维斯 饰）和母亲（斯嘉丽·约翰逊 饰）生活在纳粹德国统治下，他不知道母亲在家中藏着一个犹太女孩（托马辛·麦肯齐 饰），而母亲秘密为抵抗军工作。乔乔渴望加入希特勒青年团，他脑内出了一个颠覆版的希特勒（塔伊加·维迪提 饰），这个希特勒有魅力、傻傻的、天真可爱，是他的朋友，帮助他应付生活中的困境。', '108分钟', '剧情 喜剧 战争', 7.4, 3110, NULL, '2020-03-11 00:00:00', '美国', 'static/static/movies/乔乔的异想世界/picture/1583716556778.jpg', 1);
INSERT INTO `movie` VALUES (28, '你好霸王龙', 'My Tyrano', '段奥娟:小樱', '林珍钊', '冰河世纪即将到来，恐龙们纷纷踏上寻找绿洲的旅程。 只吃素的霸王龙哈特（青琳昊 配音）和不敢飞的翼龙少女小樱（段奥娟 配音）误打误撞成了旅伴，两人一路伴随着欢乐与冒险，甚至经历了生死危机，各自解开了心结，成为彼此生命中的重要伙伴……', '97分钟', '动画，剧情', 8.2, 0, NULL, '2020-03-11 00:00:00', '中国大陆，日本，韩国', 'static/static/movies/你好霸王龙/picture/1583716915159.jpg', 0);
INSERT INTO `movie` VALUES (29, '夺冠', 'To win the champion', '巩俐:郎平,黄渤:陈忠和,彭昱畅:青年陈忠和', '陈可辛', '2008年8月15日，北京奥运会女排比赛，中国VS美国。戴着金丝框眼镜的郎平（巩俐 饰）坐在美国队教练席上，大气沉稳，目光如电；中国队教练陈忠和（黄渤 饰）站在场边，全神贯注，面带笑容。陈忠和望向郎平，目光充满深意，不断经过的人影遮蔽了他的视线，中国女排三十余年的沉浮图景被缓缓打开……', '135分钟', '剧情', 9.2, 2677, NULL, '2020-03-07 00:00:00', '中国大陆，中国香港', 'static/static/movies/夺冠/picture/1583717402010.jpg', 1);
INSERT INTO `movie` VALUES (30, '麦兜·饭宝奇兵', 'McDull: Rise of The Rice Cooker', '张正中:麦兜,孙小妞:Miss chen', '谢立文', '有一天，来自外星球的怪兽“屁屁怪”突然降临地球地球，大肆破坏 。全球进入一级戒备，即使各样的武器都无能为力。科学家们开始研制机械人来对抗，于是全球公开征求机械人设计。麦兜喜欢设计傻呼呼的小发明，他带着“电饭宝”这个设计去参加机械人马拉松........', '/84分钟', '动画 喜剧 冒险', 7.1, 0, NULL, '2020-04-21 00:00:00', '中国大陆,中国香港', 'static/static/movies/麦兜·饭宝奇兵/picture/1583717963301.jpg', 0);
INSERT INTO `movie` VALUES (31, '忠犬流浪记', 'A Dong\'s Tale', '叮当:叮当,应昊茗:杨奇', '桑凯•维杜郎', '根据搜救犬“叮当”真实背景原型改编，讲述了消防战士杨奇（应昊茗 饰）在一次地震救援中因伤提前退役，被迫与自己训养多年的搜救犬“叮当”忍痛离别。多年以后，搜救犬“叮当”却偷跑出疗养基地，沦落为流浪犬的它用尽了自己一生寻找最初训导员杨奇的感人故事。', '90分钟', '剧情，家庭', 8.7, 0, NULL, '2020-03-14 00:00:00', '中国大陆，泰国', 'static/static/movies/忠犬流浪记/picture/1583718295846.jpg', 0);

-- ----------------------------
-- Table structure for movieorder
-- ----------------------------
DROP TABLE IF EXISTS `movieorder`;
CREATE TABLE `movieorder`  (
  `order_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_state` int(11) NULL DEFAULT NULL,
  `schedule_id` bigint(20) NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `order_price` int(11) NULL DEFAULT NULL,
  `order_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movieorder
-- ----------------------------
INSERT INTO `movieorder` VALUES ('101d29a16005060', '5排6座', 2, 32, 1, 30, '2020-05-22 16:19:09');
INSERT INTO `movieorder` VALUES ('12a601866005070', '5排7座', 1, 32, 1, 30, '2020-05-22 16:19:09');
INSERT INTO `movieorder` VALUES ('2093bfce9006040', '6排4座', 1, 22, 2, 30, '2020-05-14 19:47:50');
INSERT INTO `movieorder` VALUES ('210fb64e3007050', '7排5座', 1, 26, 2, 30, '2020-05-15 18:58:49');
INSERT INTO `movieorder` VALUES ('2316e82ae9003080', '3排8座', 0, 22, 23, 30, '2020-05-14 21:50:49');
INSERT INTO `movieorder` VALUES ('233341bab3003070', '3排7座', 0, 22, 23, 30, '2020-05-14 21:48:37');
INSERT INTO `movieorder` VALUES ('236b764fb8007070', '7排7座', 0, 22, 23, 30, '2020-05-14 21:39:13');
INSERT INTO `movieorder` VALUES ('236bb9ed04006090', '6排9座', 0, 22, 23, 30, '2020-05-14 21:39:31');
INSERT INTO `movieorder` VALUES ('237ae0879900710', '7排10座', 0, 22, 23, 30, '2020-05-14 21:46:45');
INSERT INTO `movieorder` VALUES ('23a8d81685007070', '7排7座', 0, 22, 23, 30, '2020-05-14 21:46:45');
INSERT INTO `movieorder` VALUES ('23d4bec459003060', '3排6座', 0, 22, 23, 30, '2020-05-14 21:50:49');
INSERT INTO `movieorder` VALUES ('23dee55ca007070', '7排7座', 1, 26, 2, 30, '2020-05-15 19:05:45');
INSERT INTO `movieorder` VALUES ('23e169e20f008070', '8排7座', 1, 22, 23, 30, '2020-05-14 21:46:17');
INSERT INTO `movieorder` VALUES ('252886836f008070', '8排7座', 2, 27, 25, 30, '2020-05-15 08:53:41');
INSERT INTO `movieorder` VALUES ('258aeca025002030', '2排3座', 1, 27, 25, 30, '2020-05-15 08:53:41');
INSERT INTO `movieorder` VALUES ('25d6333792009040', '9排4座', 1, 27, 25, 30, '2020-05-15 08:53:41');
INSERT INTO `movieorder` VALUES ('25e1a280a300210', '2排10座', 1, 27, 25, 30, '2020-05-15 08:53:41');
INSERT INTO `movieorder` VALUES ('264f5cef5007070', '7排7座', 2, 26, 2, 30, '2020-05-15 08:35:47');
INSERT INTO `movieorder` VALUES ('2977a57a6f006090', '6排9座', 1, 26, 29, 30, '2020-05-16 07:43:16');
INSERT INTO `movieorder` VALUES ('29df9bf028006090', '6排9座', 1, 26, 29, 30, '2020-05-16 07:43:03');
INSERT INTO `movieorder` VALUES ('2dc6b9a6e005070', '5排7座', 1, 26, 2, 30, '2020-05-15 19:05:02');
INSERT INTO `movieorder` VALUES ('2e4ddd33e007060', '7排6座', 2, 26, 2, 30, '2020-05-15 08:35:47');
INSERT INTO `movieorder` VALUES ('35aa4e578008070', '8排7座', 0, 20, 3, 31, '2020-04-17 09:10:06');
INSERT INTO `movieorder` VALUES ('373eeece3002040', '2排4座', 0, 20, 3, 31, '2020-04-17 09:10:37');
INSERT INTO `movieorder` VALUES ('4dfa68324007080', '7排8座', 0, 20, 4, 31, '2020-04-17 18:09:30');
INSERT INTO `movieorder` VALUES ('4f3e25978008060', '8排6座', 1, 20, 4, 31, '2020-04-17 18:09:30');

-- ----------------------------
-- Table structure for schedule
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule`  (
  `schedule_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hall_id` bigint(20) NULL DEFAULT NULL,
  `movie_id` bigint(20) NULL DEFAULT NULL,
  `schedule_startTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `schedule_price` int(11) NULL DEFAULT NULL,
  `schedule_seatRemain` int(11) NULL DEFAULT NULL,
  `schedule_state` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`schedule_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO `schedule` VALUES (1, 1, 4, '2020-03-19 20:00', 35, 144, 0);
INSERT INTO `schedule` VALUES (2, 5, 4, '2020-03-19 21:00', 30, 144, 0);
INSERT INTO `schedule` VALUES (3, 6, 24, '2020-03-19 22:00', 30, 142, 0);
INSERT INTO `schedule` VALUES (4, 1, 4, '2020-03-26 00:00', 30, 144, 0);
INSERT INTO `schedule` VALUES (5, 6, 4, '2020-03-26 21:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (6, 1, 15, '2020-03-27 14:00', 30, 144, 0);
INSERT INTO `schedule` VALUES (7, 5, 15, '2020-03-15 15:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (8, 9, 15, '2020-03-27 22:00', 30, 143, 1);
INSERT INTO `schedule` VALUES (9, 1, 24, '2020-03-30 20:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (10, 2, 24, '2020-03-30 14:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (11, 5, 24, '2020-03-31 18:00', 40, 139, 1);
INSERT INTO `schedule` VALUES (12, 10, 24, '2020-03-31 22:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (13, 33, 24, '2020-04-01 21:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (14, 16, 24, '2020-03-31 14:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (15, 5, 24, '2020-03-31 12:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (16, 6, 24, '2020-03-31 21:00', 35, 144, 1);
INSERT INTO `schedule` VALUES (17, 8, 24, '2020-03-31 19:00', 31, 144, 1);
INSERT INTO `schedule` VALUES (18, 8, 4, '2020-04-15 21:00', 31, 144, 1);
INSERT INTO `schedule` VALUES (19, 5, 4, '2020-04-15 14:00', 45, 142, 1);
INSERT INTO `schedule` VALUES (20, 5, 29, '2020-04-18 21:00', 31, 137, 1);
INSERT INTO `schedule` VALUES (21, 3, 27, '2020-05-15 00:04', 30, 144, 1);
INSERT INTO `schedule` VALUES (22, 1, 4, '2020-05-15 00:00', 30, 137, 1);
INSERT INTO `schedule` VALUES (23, 6, 4, '2020-05-17 00:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (24, 22, 4, '2020-05-17 00:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (25, 1, 4, '2020-05-18 00:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (26, 8, 4, '2020-05-16 22:00', 30, 135, 1);
INSERT INTO `schedule` VALUES (27, 12, 4, '2020-05-16 22:00', 30, 140, 1);
INSERT INTO `schedule` VALUES (28, 26, 4, '2020-05-16 22:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (29, 20, 4, '2020-05-16 21:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (30, 6, 4, '2020-05-16 20:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (31, 5, 4, '2020-05-17 17:00', 30, 144, 1);
INSERT INTO `schedule` VALUES (32, 1, 4, '2020-05-22 21:00', 30, 142, 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_role` int(11) NULL DEFAULT NULL,
  `user_photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123', '1614898342@qq.com', 1, '/static/static/upload/head/1583651160362.jpeg');
INSERT INTO `user` VALUES (2, '西北偏北', '123', '1614898342@qq.com', 0, '/static/static/upload/head/1583672772865.jpeg');
INSERT INTO `user` VALUES (3, '狗不理', '123', '1614898342@qq.com', 0, '/static/static/upload/head/1583825347762.jpg');
INSERT INTO `user` VALUES (4, '秋天', '123', '1614898342', 0, '/static/static/upload/head/1583825633066.jpg');
INSERT INTO `user` VALUES (5, '木小木', '123', '1614898342', 0, NULL);
INSERT INTO `user` VALUES (6, '天夜月', '123', '1614898342', 0, NULL);
INSERT INTO `user` VALUES (7, '飞来飞去的肥虫虫', '123', '16148983', 0, NULL);
INSERT INTO `user` VALUES (8, '夜观天象的猪', '123', '16148983', 0, '/static/static/upload/head/1583827752434.jpg');
INSERT INTO `user` VALUES (9, '依然', '123', '1614898342', 0, NULL);
INSERT INTO `user` VALUES (10, '百事可乐', '123', '1614898342@qq', 0, '/static/static/upload/head/1583827678402.jpg');
INSERT INTO `user` VALUES (11, 'Yui', '123', '1614898342@qq.com', 0, NULL);
INSERT INTO `user` VALUES (12, 'LUKA', '123', '1234', 0, NULL);
INSERT INTO `user` VALUES (13, '喵了个咪', '123', '123', 0, NULL);
INSERT INTO `user` VALUES (14, 'lala', '123', '123#dfd', 0, NULL);
INSERT INTO `user` VALUES (15, '猫狗', '123', '1614898342@qq.com', 0, NULL);
INSERT INTO `user` VALUES (16, 'sister', '123', '123', 0, NULL);
INSERT INTO `user` VALUES (17, 'BlackUncle', '123', '123', 0, NULL);
INSERT INTO `user` VALUES (18, 'customer10', '12', '12', 0, NULL);
INSERT INTO `user` VALUES (19, 'customer9', '123', '123', 0, NULL);
INSERT INTO `user` VALUES (22, 'Tibet', '123', '1614898342@qq.com', 0, '/static/static/upload/head/1583825883535.jpg');
INSERT INTO `user` VALUES (23, '一切随风', '123', '1614898342@qq.com', 0, '/static/static/upload/head/1583826156759.jpeg');
INSERT INTO `user` VALUES (24, '苹果苹果我是橙子', '123', '1614898342@qq.com', 0, '/static/static/upload/head/1583826564322.jpeg');
INSERT INTO `user` VALUES (25, 'Alisa', '123', '1614898342@qq.com', 0, '/static/static/upload/head/1583826922435.jpeg');
INSERT INTO `user` VALUES (26, '是大哥啊', '123', '1614898342@qq.com', 0, '/static/static/upload/head/1583827256682.jpg');
INSERT INTO `user` VALUES (27, '文凯', '123', '1614898342@qq.com', 0, '/static/static/upload/head/1587609573710.jpg');
INSERT INTO `user` VALUES (28, 'angry', '123', '1614898342@qq.com', 0, NULL);
INSERT INTO `user` VALUES (29, 'aaa', '123', '1614898342@qq.com', 0, NULL);

SET FOREIGN_KEY_CHECKS = 1;
