
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `think_admin_user`
-- ----------------------------
DROP TABLE IF EXISTS `think_admin_user`;
CREATE TABLE `think_admin_user` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '管理员用户名',
  `password` varchar(50) NOT NULL DEFAULT '' COMMENT '管理员密码',
  `headimgurl` varchar(255) DEFAULT NULL COMMENT '头像',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1 启用 0 禁用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(20) DEFAULT NULL COMMENT '最后登录IP',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Table structure for `think_advertising`
-- ----------------------------
DROP TABLE IF EXISTS `think_advertising`;
CREATE TABLE `think_advertising` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `adname` varchar(50) NOT NULL DEFAULT '' COMMENT '广告名称',
  `adurl` varchar(50) NOT NULL DEFAULT '' COMMENT '链接地址',
  `adpic` varchar(255) DEFAULT NULL COMMENT '广告图片',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1 正常 2 禁止',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of think_advertising
-- ----------------------------
INSERT INTO `think_advertising` VALUES ('2', 'PK', '#', '/public/uploads/20161222/32ed6923707e9a8feb84d3d971954c53.jpg', '3', '1', '2016-12-15 15:39:29');
INSERT INTO `think_advertising` VALUES ('3', '学习', '#', '/public/uploads/20161222/6998df8e5e2297c16288aacf80ede069.jpg', '2', '1', '2016-12-15 18:52:04');
INSERT INTO `think_advertising` VALUES ('4', '圣诞', '#', '/public/uploads/20161222/5f60a95b2af69f944ab4e07eafc5df3f.jpg', '1', '1', '2016-12-22 16:39:05');

-- ----------------------------
-- Table structure for `think_article`
-- ----------------------------
DROP TABLE IF EXISTS `think_article`;
CREATE TABLE `think_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `cid` smallint(5) unsigned NOT NULL COMMENT '分类ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `introduction` varchar(255) DEFAULT '' COMMENT '简介',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键词用,隔开也相关于Tag',
  `content` longtext COMMENT '内容',
  `author` varchar(20) DEFAULT '' COMMENT '作者',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态 0 待审核  1 审核',
  `reading` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '阅读量',
  `thumb` varchar(255) DEFAULT '' COMMENT '缩略图',
  `photo` text COMMENT '图集',
  `template` varchar(50) DEFAULT '' COMMENT '文章模板',
  `is_top` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶  0 不置顶  1 置顶',
  `is_good` tinyint(3) unsigned DEFAULT NULL COMMENT '是否推荐 0 不推荐 1 推荐',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `tag` tinyint(3) unsigned DEFAULT '0' COMMENT '标签 0 转载 1 原创',
  `position` varchar(100) DEFAULT NULL COMMENT '所在位置',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `publish_time` datetime NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of think_article
-- ----------------------------
INSERT INTO `think_article` VALUES ('38', '1', '本博客2.0版本已开源！', '博客后台采用ThinkPHP V5.0，前端页面使用bootstrap3.0开发；\n博客模板为响应式设计，可兼容手机访问。\n亮点：本博客QQ快速登陆,无需申请QQ互联,也不需要任何配置就能用QQ快速登陆博客！', 'ThinkPHP，bootstrap，响应式，兼容手机，QQ互联', '<p>博客后台采用ThinkPHP V5.0，前端页面使用bootstrap3.0开发；</p><p>博客模板为响应式设计，可兼容手机访问。</p><p><b>亮点：</b>本博客QQ快速登陆,无需申请QQ互联,也不需要任何配置就能用QQ快速登陆博客！</p><p><span>适合新手<img src=\"http://www.xuexiaofeng.com/Public/Common/kindeditor/attached/image/20160307/20160307223955_58373.jpg\" alt=\"\"><br><br></span></p><p><span>大神路过看看就行<img src=\"http://www.xuexiaofeng.com/Public/Common/kindeditor/attached/image/20160307/20160307224017_34126.gif\" alt=\"\"></span></p>', 'admin', '1', '24', '/public/uploads/20161222/09ec22db8e85801deff87431f63e80a1.jpg', null, '', '1', '1', '0', '1', '广东省广州市', '2016-12-22 17:04:38', '2016-12-22 17:00:42');
INSERT INTO `think_article` VALUES ('36', '1', 'php对字符串进行倒叙', '', 'php', '<pre class=\"prettyprint lang-php\">str_split() 函数把字符串分割到数组中。\narray_reverse() 接受数组 array 作为输入并返回一个单元为相反顺序的新数组\nimplode() 函数把数组元素组合为一个字符串。</pre>', 'admin', '1', '9', '/public/uploads/20161222/13e8edc12bd9bf284df8806c581b1512.jpg', null, '', '0', '0', '0', '0', '广东省广州市', '2016-12-22 16:51:35', '2016-12-22 16:50:53');
INSERT INTO `think_article` VALUES ('37', '1', 'php格式化商品价格', '', 'php，格式化', '<pre class=\"prettyprint lang-php\">/**\n * 格式化商品价格\n * @access  public\n * @param   float   $price  商品价格\n * @return  string\n */\nfunction price_format($price, $change_price = true){\n    if($price===\'\'){\n        $price=0;\n    }\n    if($change_price){\n        switch ($price){\n            case 0:\n                $price = number_format($price, 2, \'.\', \'\');\n                break;\n            case 1: // 保留不为 0 的尾数\n                $price = preg_replace(\'/(.*)(\\\\.)([0-9]*?)0+$/\', \'\\1\\2\\3\', number_format($price, 2, \'.\', \'\'));\n                if (substr($price, -1) == \'.\'){\n                    $price = substr($price, 0, -1);\n                }\n                break;\n            case 2: // 不四舍五入，保留1位\n                $price = substr(number_format($price, 2, \'.\', \'\'), 0, -1);\n                break;\n            case 3: // 直接取整\n                $price = intval($price);\n                break;\n            case 4: // 四舍五入，保留 1 位\n                $price = number_format($price, 1, \'.\', \'\');\n                break;\n            case 5: // 先四舍五入，不保留小数\n                $price = round($price);\n                break;\n        }\n    }else{\n        $price = number_format($price, 2, \'.\', \'\');\n    }\n\n    return $price;\n}</pre>', 'admin', '1', '10', '/public/uploads/20161222/f21919f7e6d09b5763ec2dc08a2ca775.jpg', null, '', '0', '0', '0', '0', '广东省广州市', '2016-12-22 16:53:02', '2016-12-22 16:51:36');
INSERT INTO `think_article` VALUES ('35', '1', 'php逐个汉字遍历字符串', 'php逐个汉字遍历字符串', '中文分词', '<p><span>php逐个汉字遍历字符串</span></p><p></p><pre class=\"prettyprint lang-php\"><pre class=\"prettyprint lang-php\">function str_split_unicode($str, $l = 0) {\n    if ($l &gt; 0) {\n        $ret = array();\n        $len = mb_strlen($str, \"UTF-8\");\n        for ($i = 0; $i &lt; $len; $i += $l) {\n            $ret[] = mb_substr($str, $i, $l, \"UTF-8\");\n        }\n        return $ret;\n    }\n    return preg_split(\"//u\", $str, -1, PREG_SPLIT_NO_EMPTY);\n}</pre>\n</pre>', 'admin', '1', '6', '/public/uploads/20161222/f6bddbde8defb8a9f44f53af73eb6ccb.jpg', null, '', '0', '0', '0', '0', '广东省广州市', '2016-12-22 16:44:07', '2016-12-22 16:42:28');
INSERT INTO `think_article` VALUES ('39', '3', 'Apache开启伪静态', 'php访问静态页面报错，这些都是apache伪静态没开启,没支持网站下.htaccess文件原因造成的。因为采用了伪静态技术，所以web服务器必须开启伪静态 。', 'Apache，伪静态', '<p><strong>环境：</strong><br>系统 Windows8.1<br>Apache 2.2</p><p><strong>加载Rewrite模块：</strong></p><p>在conf目录下httpd.conf中找到<br></p><p>LoadModule&nbsp;rewrite_module&nbsp;modules/mod_rewrite.so</p><p><br>这句，去掉前边的注释符号“#”，或添加这句。</p><p>允许在任何目录中使用“.htaccess”文件，将“AllowOverride”改成“All”（默认为“None”）：</p><div id=\"highlighter_232160\" class=\"syntaxhighlighter  \"><div class=\"lines\"><div class=\"line alt1\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">1</code></td><td class=\"content\"><code class=\"plain\">#&nbsp;AllowOverride&nbsp;controls&nbsp;what&nbsp;directives&nbsp;may&nbsp;be&nbsp;placed&nbsp;in&nbsp;.htaccess&nbsp;files.</code></td></tr></tbody></table></div><div class=\"line alt2\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">2</code></td><td class=\"content\"><code class=\"plain\">#&nbsp;It&nbsp;can&nbsp;be&nbsp;“All”,&nbsp;“None”,&nbsp;</code><code class=\"keyword\">or</code>&nbsp;<code class=\"plain\">any&nbsp;combination&nbsp;of&nbsp;the&nbsp;keywords:</code></td></tr></tbody></table></div><div class=\"line alt1\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">3</code></td><td class=\"content\"><code class=\"plain\">#&nbsp;Options&nbsp;FileInfo&nbsp;AuthConfig&nbsp;Limit</code></td></tr></tbody></table></div><div class=\"line alt2\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">4</code></td><td class=\"content\"><code class=\"plain\">#</code></td></tr></tbody></table></div><div class=\"line alt1\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">5</code></td><td class=\"content\"><code class=\"plain\">AllowOverride&nbsp;All</code></td></tr></tbody></table></div></div></div><p><br></p><p>&nbsp;</p><p>在Windows系统下不能直接建立“.htaccess”文件，可以在命令行下使用“echo a&gt; .htaccess”建立，然后使用记事本编辑。</p><p>Apache Rewrite模块的简单应用：<br>Rewrite的所有判断规则均基于Perl风格的正则表达式，通过以下基础示例能写出符合自己跳转需求的代码。</p><p><strong>1、请求跳转</strong></p><p>目的是如果请求为.jsp文件，则跳转至其它域名访问。</p><p>例如：访问www.clin003.com/a.php跳转至b.clin003.com/b.php网页，访问www.clin003.com/news/index.php跳转至b.clin003.com/news/index.php网页</p><p>注意：不是使用HTML技术中的meta或者javas<wbr><wbr>cript方式，因为www.clin003.com/a.php这个文件并不存在，用的是Apache2.2服务器中的Rewrite模块。</p><p>修改 .htaccess或apche的配置文件httpd.conf文件，添加以下内容</p><div id=\"highlighter_620675\" class=\"syntaxhighlighter  \"><div class=\"lines\"><div class=\"line alt1\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">1</code></td><td class=\"content\"><code class=\"plain\">RewriteEngine&nbsp;on</code></td></tr></tbody></table></div><div class=\"line alt2\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">2</code></td><td class=\"content\"><code class=\"plain\">#开启Rewrite模块</code></td></tr></tbody></table></div><div class=\"line alt1\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">3</code></td><td class=\"content\"><code class=\"plain\">RewriteRule&nbsp;(.*)\\.php$&nbsp;http:</code><code class=\"comments\">//b.clin003.com/$1\\.jsp&nbsp;[R=301,L,NC]</code></td></tr></tbody></table></div><div class=\"line alt2\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">4</code></td><td class=\"content\"><code class=\"plain\">#截获所有.jsp请求，跳转到http:</code><code class=\"comments\">//b.clin003.com/加上原来的请求再加上.php。R=301为301跳转，L为rewrite规则到此终止，NC为不区分大小写</code></td></tr></tbody></table></div></div></div><p><br></p><p><br></p><p><strong>2、域名跳转</strong></p><p>如果请求为old.clin003.com下的所有URL，跳转至b.clin003.com</p><div id=\"highlighter_680934\" class=\"syntaxhighlighter  \"><div class=\"lines\"><div class=\"line alt1\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">1</code></td><td class=\"content\"><code class=\"plain\">RewriteEngine&nbsp;on</code></td></tr></tbody></table></div><div class=\"line alt2\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">2</code></td><td class=\"content\"><code class=\"plain\">#开启Rewrite模块</code></td></tr></tbody></table></div><div class=\"line alt1\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">3</code></td><td class=\"content\"><code class=\"plain\">RewriteCond&nbsp;%{REMOTE_HOST}&nbsp;^old.studenthome.cn$&nbsp;[NC]</code></td></tr></tbody></table></div><div class=\"line alt2\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">4</code></td><td class=\"content\"><code class=\"plain\">#针对host为old.clin003.com的主机做处理，^为开始字符，$为结尾字符</code></td></tr></tbody></table></div><div class=\"line alt1\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">5</code></td><td class=\"content\"><code class=\"plain\">RewriteRule&nbsp;(.*)&nbsp;http:</code><code class=\"comments\">//b.clin003.com/$1&nbsp;[R=301,L,NC]</code></td></tr></tbody></table></div></div></div><p><br></p><p><strong>3、防盗链</strong></p><p>如果本网站的图片不想让其它网站调用，可以在 .htaccess或者apche的配置文件httpd.conf文件中添加以下内容</p><p><br></p><div id=\"highlighter_220769\" class=\"syntaxhighlighter  \"><div class=\"lines\"><div class=\"line alt1\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">01</code></td><td class=\"content\"><code class=\"plain\">RewriteEngine&nbsp;on</code></td></tr></tbody></table></div><div class=\"line alt2\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">02</code></td><td class=\"content\"><code class=\"plain\">#开启Rewrite模块</code></td></tr></tbody></table></div><div class=\"line alt1\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">03</code></td><td class=\"content\"><code class=\"plain\">RewriteCond&nbsp;%{HTTP_REFERER}&nbsp;!^$</code></td></tr></tbody></table></div><div class=\"line alt2\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">04</code></td><td class=\"content\"><code class=\"plain\">#如果不是直接输入图片地址</code></td></tr></tbody></table></div><div class=\"line alt1\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">05</code></td><td class=\"content\"><code class=\"plain\">RewriteCond&nbsp;%{HTTP_REFERER}&nbsp;!img.clin003.com$&nbsp;[NC]</code></td></tr></tbody></table></div><div class=\"line alt2\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">06</code></td><td class=\"content\"><code class=\"plain\">#且如果不是img.clin003.com所有子域名调用的</code></td></tr></tbody></table></div><div class=\"line alt1\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">07</code></td><td class=\"content\"><code class=\"plain\">RewriteCond&nbsp;%{HTTP_REFERER}&nbsp;!img.clin003.com/(.*)$&nbsp;[NC]</code></td></tr></tbody></table></div><div class=\"line alt2\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">08</code></td><td class=\"content\"><code class=\"plain\">RewriteCond&nbsp;%{HTTP_REFERER}&nbsp;!zhuaxia.com&nbsp;[NC]</code></td></tr></tbody></table></div><div class=\"line alt1\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">09</code></td><td class=\"content\"><code class=\"plain\">RewriteCond&nbsp;%{HTTP_REFERER}&nbsp;!google.com&nbsp;[NC]</code></td></tr></tbody></table></div><div class=\"line alt2\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">10</code></td><td class=\"content\"><code class=\"plain\">RewriteCond&nbsp;%{HTTP_REFERER}&nbsp;!google.cn&nbsp;[NC]</code></td></tr></tbody></table></div><div class=\"line alt1\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">11</code></td><td class=\"content\"><code class=\"plain\">RewriteCond&nbsp;%{HTTP_REFERER}&nbsp;!baidu.com&nbsp;[NC]</code></td></tr></tbody></table></div><div class=\"line alt2\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">12</code></td><td class=\"content\"><code class=\"plain\">RewriteCond&nbsp;%{HTTP_REFERER}&nbsp;!feedsky.com&nbsp;[NC]</code></td></tr></tbody></table></div><div class=\"line alt1\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">13</code></td><td class=\"content\"><code class=\"plain\">RewriteRule&nbsp;(.*)\\.(jpg|jpeg|jpe|gif|bmp|png|wma|mp3|wav|avi|mp4|flv|swf)$&nbsp;http:</code><code class=\"comments\">//clin003.com/err.jpg&nbsp;[R=301,L,NC]</code></td></tr></tbody></table></div><div class=\"line alt2\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">14</code></td><td class=\"content\"><code class=\"plain\">#截获所有.jpg或.jpeg……请求，跳转到http:</code><code class=\"comments\">//clin003.com/err.jpg提示错误的图片，注：该图片不能在原域名下，也不能在该.htaccess文件有效控制的文件夹中</code></td></tr></tbody></table></div></div></div><p></p><p>4、不需要定义.htaccess文件</p><p>在Apache2\\conf\\httpd.conf 最后一行添加</p><p>RewriteEngine&nbsp;On<br>RewriteRule&nbsp;^(.*)-htm-(.*)$&nbsp;$1.php?$2</p><p><br></p><p>5.重启Apache即可</p>', 'admin', '1', '11', '/public/uploads/20161222/d5056da3b6e6ab9ee3f977c9c2694d2e.png', null, '', '0', '0', '0', '0', '广东省广州市', '2016-12-22 17:19:29', '2016-12-22 17:18:51');
INSERT INTO `think_article` VALUES ('40', '1', 'PHP实现时间轴函数', '本文介绍如何用PHP将时间显示为“刚刚”、“5分钟前”、“昨天10:23”等时间轴形式，而不是直接显示具体日期和时间。', '', '<p>本文将介绍如何实现基于时间轴的时间的转换。</p><p>首先我们要明白时间的几个函数：</p><p>time():返回当前的 Unix 时间戳</p><p>date():格式化一个本地时间／日期。</p><p>应用举例：</p><pre><code class=\"php\">date(<span class=\"php__string2\">\"Y-m-d&nbsp;H:i:s\"</span>,time());&nbsp;<br></code></pre><p>格式化当前时间，输出：2010-10-11 05:27:35</p><p>strtotime():将任何英文文本的日期时间描述解析为 Unix 时间戳。</p><p>应用举例：</p><pre><code class=\"php\"><span class=\"php__keyword\">echo</span>&nbsp;strtotime(<span class=\"php__string2\">\"+1&nbsp;day\"</span>),&nbsp;<span class=\"php__string2\">\"n\"</span>;&nbsp;<br></code></pre><p>输出1天前的时间戳：1286861475</p><p>date_default_timezone_set():设定要用的默认时区。</p><p>一般我们设置北京时间：date_default_timezone_set(\"PRC\");</p><p>理解上面几个函数后我们来写时间轴函数：</p><p>该函数的原理就是将系统当前时间与目标时间比较，得到一个差值，再将差值与时间范围（转换成秒）比较，根据其处在时间轴的范围输出不同的结果（如：5分钟前）。为了便于计算，我们将时间都转换成Unix时间戳。</p><div id=\"highlighter_178539\" class=\"syntaxhighlighter  \"><div class=\"lines\"><div class=\"line alt1\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">01</code></td><td class=\"content\"><code class=\"keyword\">function</code>&nbsp;<code class=\"plain\">tranTime(</code><code class=\"variable\">$time</code><code class=\"plain\">)&nbsp;{&nbsp;</code></td></tr></tbody></table></div><div class=\"line alt2\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">02</code></td><td class=\"content\"><code class=\"spaces\">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"variable\">$rtime</code>&nbsp;<code class=\"plain\">=&nbsp;</code><code class=\"functions\">date</code><code class=\"plain\">(</code><code class=\"string\">\"Y-m-d&nbsp;H:i\"</code><code class=\"plain\">,&nbsp;</code><code class=\"variable\">$time</code><code class=\"plain\">);&nbsp;</code></td></tr></tbody></table></div><div class=\"line alt1\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">03</code></td><td class=\"content\"><code class=\"spaces\">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"variable\">$htime</code>&nbsp;<code class=\"plain\">=&nbsp;</code><code class=\"functions\">date</code><code class=\"plain\">(</code><code class=\"string\">\"H:i\"</code><code class=\"plain\">,&nbsp;</code><code class=\"variable\">$time</code><code class=\"plain\">);&nbsp;</code></td></tr></tbody></table></div><div class=\"line alt2\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">04</code></td><td class=\"content\"><code class=\"spaces\">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"variable\">$time</code>&nbsp;<code class=\"plain\">=&nbsp;time()&nbsp;-&nbsp;</code><code class=\"variable\">$time</code><code class=\"plain\">;&nbsp;</code></td></tr></tbody></table></div><div class=\"line alt1\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">05</code></td><td class=\"content\"><code class=\"spaces\">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"keyword\">if</code>&nbsp;<code class=\"plain\">(</code><code class=\"variable\">$time</code>&nbsp;<code class=\"plain\">&lt;&nbsp;60)&nbsp;{&nbsp;</code></td></tr></tbody></table></div><div class=\"line alt2\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">06</code></td><td class=\"content\"><code class=\"spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"variable\">$str</code>&nbsp;<code class=\"plain\">=&nbsp;</code><code class=\"string\">\'刚刚\'</code><code class=\"plain\">;&nbsp;</code></td></tr></tbody></table></div><div class=\"line alt1\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">07</code></td><td class=\"content\"><code class=\"spaces\">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"plain\">}&nbsp;</code><code class=\"keyword\">elseif</code>&nbsp;<code class=\"plain\">(</code><code class=\"variable\">$time</code>&nbsp;<code class=\"plain\">&lt;&nbsp;60&nbsp;*&nbsp;60)&nbsp;{&nbsp;</code></td></tr></tbody></table></div><div class=\"line alt2\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">08</code></td><td class=\"content\"><code class=\"spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"variable\">$min</code>&nbsp;<code class=\"plain\">=&nbsp;</code><code class=\"functions\">floor</code><code class=\"plain\">(</code><code class=\"variable\">$time</code>&nbsp;<code class=\"plain\">/&nbsp;60);&nbsp;</code></td></tr></tbody></table></div><div class=\"line alt1\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">09</code></td><td class=\"content\"><code class=\"spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"variable\">$str</code>&nbsp;<code class=\"plain\">=&nbsp;</code><code class=\"variable\">$min</code>&nbsp;<code class=\"plain\">.&nbsp;</code><code class=\"string\">\'分钟前\'</code><code class=\"plain\">;&nbsp;</code></td></tr></tbody></table></div><div class=\"line alt2\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">10</code></td><td class=\"content\"><code class=\"spaces\">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"plain\">}&nbsp;</code><code class=\"keyword\">elseif</code>&nbsp;<code class=\"plain\">(</code><code class=\"variable\">$time</code>&nbsp;<code class=\"plain\">&lt;&nbsp;60&nbsp;*&nbsp;60&nbsp;*&nbsp;24)&nbsp;{&nbsp;</code></td></tr></tbody></table></div><div class=\"line alt1\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">11</code></td><td class=\"content\"><code class=\"spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"variable\">$h</code>&nbsp;<code class=\"plain\">=&nbsp;</code><code class=\"functions\">floor</code><code class=\"plain\">(</code><code class=\"variable\">$time</code>&nbsp;<code class=\"plain\">/&nbsp;(60&nbsp;*&nbsp;60));&nbsp;</code></td></tr></tbody></table></div><div class=\"line alt2\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">12</code></td><td class=\"content\"><code class=\"spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"variable\">$str</code>&nbsp;<code class=\"plain\">=&nbsp;</code><code class=\"variable\">$h</code>&nbsp;<code class=\"plain\">.&nbsp;</code><code class=\"string\">\'小时前&nbsp;\'</code>&nbsp;<code class=\"plain\">.&nbsp;</code><code class=\"variable\">$htime</code><code class=\"plain\">;&nbsp;</code></td></tr></tbody></table></div><div class=\"line alt1\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">13</code></td><td class=\"content\"><code class=\"spaces\">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"plain\">}&nbsp;</code><code class=\"keyword\">elseif</code>&nbsp;<code class=\"plain\">(</code><code class=\"variable\">$time</code>&nbsp;<code class=\"plain\">&lt;&nbsp;60&nbsp;*&nbsp;60&nbsp;*&nbsp;24&nbsp;*&nbsp;3)&nbsp;{&nbsp;</code></td></tr></tbody></table></div><div class=\"line alt2\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">14</code></td><td class=\"content\"><code class=\"spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"variable\">$d</code>&nbsp;<code class=\"plain\">=&nbsp;</code><code class=\"functions\">floor</code><code class=\"plain\">(</code><code class=\"variable\">$time</code>&nbsp;<code class=\"plain\">/&nbsp;(60&nbsp;*&nbsp;60&nbsp;*&nbsp;24));&nbsp;</code></td></tr></tbody></table></div><div class=\"line alt1\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">15</code></td><td class=\"content\"><code class=\"spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"keyword\">if</code>&nbsp;<code class=\"plain\">(</code><code class=\"variable\">$d</code>&nbsp;<code class=\"plain\">==&nbsp;1)&nbsp;</code></td></tr></tbody></table></div><div class=\"line alt2\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">16</code></td><td class=\"content\"><code class=\"spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"variable\">$str</code>&nbsp;<code class=\"plain\">=&nbsp;</code><code class=\"string\">\'昨天&nbsp;\'</code>&nbsp;<code class=\"plain\">.&nbsp;</code><code class=\"variable\">$rtime</code><code class=\"plain\">;&nbsp;</code></td></tr></tbody></table></div><div class=\"line alt1\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">17</code></td><td class=\"content\"><code class=\"spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"keyword\">else</code>&nbsp;</td></tr></tbody></table></div><div class=\"line alt2\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">18</code></td><td class=\"content\"><code class=\"spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"variable\">$str</code>&nbsp;<code class=\"plain\">=&nbsp;</code><code class=\"string\">\'前天&nbsp;\'</code>&nbsp;<code class=\"plain\">.&nbsp;</code><code class=\"variable\">$rtime</code><code class=\"plain\">;&nbsp;</code></td></tr></tbody></table></div><div class=\"line alt1\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">19</code></td><td class=\"content\"><code class=\"spaces\">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"plain\">}&nbsp;</code></td></tr></tbody></table></div><div class=\"line alt2\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">20</code></td><td class=\"content\"><code class=\"spaces\">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"keyword\">else</code>&nbsp;<code class=\"plain\">{&nbsp;</code></td></tr></tbody></table></div><div class=\"line alt1\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">21</code></td><td class=\"content\"><code class=\"spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"variable\">$str</code>&nbsp;<code class=\"plain\">=&nbsp;</code><code class=\"variable\">$rtime</code><code class=\"plain\">;&nbsp;</code></td></tr></tbody></table></div><div class=\"line alt2\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">22</code></td><td class=\"content\"><code class=\"spaces\">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"plain\">}&nbsp;</code></td></tr></tbody></table></div><div class=\"line alt1\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">23</code></td><td class=\"content\"><code class=\"spaces\">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"keyword\">return</code>&nbsp;<code class=\"variable\">$str</code><code class=\"plain\">;&nbsp;</code></td></tr></tbody></table></div><div class=\"line alt2\"><table class=\"layui-table\"><tbody><tr><td class=\"number\"><code style=\"text-align: right;\">24</code></td><td class=\"content\"><code class=\"plain\">}</code></td></tr></tbody></table></div></div></div><p>&nbsp; &nbsp; 函数tranTime()中的参数$time必须为Unix时间戳，如果不是请先用strtotime()将其转换成Unix时间戳。上面的代码一看就明白了，不用再多述。</p><p>调用函数，直接输出：</p><pre><code class=\"php\"><span class=\"php__keyword\">$</span><span class=\"php__variable\">times</span>=<span class=\"php__string2\">\"1286861696&nbsp;\"</span>;&nbsp;<br><span class=\"php__keyword\">echo</span>&nbsp;tranTime(<span class=\"php__keyword\">$</span><span class=\"php__variable\">times</span>);&nbsp;</code></pre><div><code class=\"php\"><br></code></div>', 'admin', '1', '18', '/public/uploads/20161222/3241ceee5d9fd116540b2aca6056349c.jpg', null, '', '0', '0', '0', '0', '广东省广州市', '2016-12-22 17:23:03', '2016-12-22 17:22:17');

-- ----------------------------
-- Table structure for `think_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `think_auth_group`;
CREATE TABLE `think_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` varchar(255) NOT NULL COMMENT '权限规则ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='权限组表';

-- ----------------------------
-- Records of think_auth_group
-- ----------------------------
INSERT INTO `think_auth_group` VALUES ('1', '超级管理组', '1', '1,2,3,5,6,7,8,9,10,11,12,39,40,41,42,43,14,13,20,21,22,23,24,15,25,26,27,28,29,30,16,17,44,45,46,47,48,18,49,50,51,52,53,19,31,32,33,34,35,36,37,54,55,56,57,58,59,60,61,62');
INSERT INTO `think_auth_group` VALUES ('5', '测试组', '1', '14,13,23,15,30');

-- ----------------------------
-- Table structure for `think_auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `think_auth_group_access`;
CREATE TABLE `think_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限组规则表';

-- ----------------------------
-- Records of think_auth_group_access
-- ----------------------------
INSERT INTO `think_auth_group_access` VALUES ('1', '1');
INSERT INTO `think_auth_group_access` VALUES ('2', '5');

-- ----------------------------
-- Table structure for `think_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `think_auth_rule`;
CREATE TABLE `think_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(20) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `pid` smallint(5) unsigned NOT NULL COMMENT '父级ID',
  `icon` varchar(50) DEFAULT '' COMMENT '图标',
  `sort` tinyint(4) unsigned NOT NULL COMMENT '排序',
  `condition` char(100) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COMMENT='规则表';

-- ----------------------------
-- Records of think_auth_rule
-- ----------------------------
INSERT INTO `think_auth_rule` VALUES ('1', 'admin/System/default', '系统配置', '1', '1', '0', 'fa fa-gear', '0', '');
INSERT INTO `think_auth_rule` VALUES ('2', 'admin/System/siteConfig', '站点配置', '1', '1', '1', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('3', 'admin/System/updateSiteConfig', '更新配置', '1', '0', '2', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('5', 'admin/Menu/default', '菜单管理', '1', '1', '0', 'fa fa-list', '0', '');
INSERT INTO `think_auth_rule` VALUES ('6', 'admin/Menu/index', '后台菜单', '1', '1', '5', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('7', 'admin/Menu/add', '添加菜单', '1', '0', '6', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('8', 'admin/Menu/save', '保存菜单', '1', '0', '6', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('9', 'admin/Menu/edit', '编辑菜单', '1', '0', '6', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('10', 'admin/Menu/update', '更新菜单', '1', '0', '6', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('11', 'admin/Menu/delete', '删除菜单', '1', '0', '6', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('12', 'admin/Nav/index', '导航管理', '1', '1', '5', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('13', 'admin/Category/index', '栏目管理', '1', '1', '14', 'fa fa-sitemap', '0', '');
INSERT INTO `think_auth_rule` VALUES ('14', 'admin/Content/default', '内容管理', '1', '1', '0', 'fa fa-file-text', '0', '');
INSERT INTO `think_auth_rule` VALUES ('15', 'admin/Article/index', '文章管理', '1', '1', '14', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('16', 'admin/User/default', '用户管理', '1', '1', '0', 'fa fa-users', '0', '');
INSERT INTO `think_auth_rule` VALUES ('17', 'admin/User/index', '普通用户', '1', '1', '16', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('18', 'admin/AdminUser/index', '管理员', '1', '1', '16', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('19', 'admin/AuthGroup/index', '权限组', '1', '1', '16', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('20', 'admin/Category/add', '添加栏目', '1', '0', '13', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('21', 'admin/Category/save', '保存栏目', '1', '0', '13', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('22', 'admin/Category/edit', '编辑栏目', '1', '0', '13', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('23', 'admin/Category/update', '更新栏目', '1', '0', '13', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('24', 'admin/Category/delete', '删除栏目', '1', '0', '13', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('25', 'admin/Article/add', '添加文章', '1', '0', '15', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('26', 'admin/Article/save', '保存文章', '1', '0', '15', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('27', 'admin/Article/edit', '编辑文章', '1', '0', '15', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('28', 'admin/Article/update', '更新文章', '1', '0', '15', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('29', 'admin/Article/delete', '删除文章', '1', '0', '15', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('30', 'admin/Article/toggle', '文章审核', '1', '0', '15', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('31', 'admin/AuthGroup/add', '添加权限组', '1', '0', '19', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('32', 'admin/AuthGroup/save', '保存权限组', '1', '0', '19', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('33', 'admin/AuthGroup/edit', '编辑权限组', '1', '0', '19', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('34', 'admin/AuthGroup/update', '更新权限组', '1', '0', '19', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('35', 'admin/AuthGroup/delete', '删除权限组', '1', '0', '19', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('36', 'admin/AuthGroup/auth', '授权', '1', '0', '19', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('37', 'admin/AuthGroup/updateAuthGroupRule', '更新权限组规则', '1', '0', '19', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('39', 'admin/Nav/add', '添加导航', '1', '0', '12', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('40', 'admin/Nav/save', '保存导航', '1', '0', '12', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('41', 'admin/Nav/edit', '编辑导航', '1', '0', '12', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('42', 'admin/Nav/update', '更新导航', '1', '0', '12', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('43', 'admin/Nav/delete', '删除导航', '1', '0', '12', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('44', 'admin/User/add', '添加用户', '1', '0', '17', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('45', 'admin/User/save', '保存用户', '1', '0', '17', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('46', 'admin/User/edit', '编辑用户', '1', '0', '17', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('47', 'admin/User/update', '更新用户', '1', '0', '17', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('48', 'admin/User/delete', '删除用户', '1', '0', '17', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('49', 'admin/AdminUser/add', '添加管理员', '1', '0', '18', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('50', 'admin/AdminUser/save', '保存管理员', '1', '0', '18', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('51', 'admin/AdminUser/edit', '编辑管理员', '1', '0', '18', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('52', 'admin/AdminUser/update', '更新管理员', '1', '0', '18', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('53', 'admin/AdminUser/delete', '删除管理员', '1', '0', '18', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('54', 'admin/database/default', '数据库', '1', '1', '0', 'fa fa-gears', '0', '');
INSERT INTO `think_auth_rule` VALUES ('55', '/admin/database/index/type/import', '数据库还原', '1', '1', '54', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('56', '/admin/database/index/type/export', '数据库备份', '1', '1', '54', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('57', 'admin/Link/default', '插件管理', '1', '1', '0', 'fa fa-link', '0', '');
INSERT INTO `think_auth_rule` VALUES ('58', 'admin/Links/index', '友情链接', '1', '1', '57', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('59', 'admin/Advertising/index', '广告管理', '1', '1', '57', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('60', 'admin/Tell/index', '说说管理', '1', '1', '57', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('61', 'admin/Guestbook/index', '留言管理', '1', '1', '57', '', '0', '');
INSERT INTO `think_auth_rule` VALUES ('62', 'admin/Tags/index', '标签管理', '1', '1', '57', '', '0', '');

-- ----------------------------
-- Table structure for `think_category`
-- ----------------------------
DROP TABLE IF EXISTS `think_category`;
CREATE TABLE `think_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `alias` varchar(50) DEFAULT '' COMMENT '导航别名',
  `content` longtext COMMENT '分类内容',
  `thumb` varchar(255) DEFAULT '' COMMENT '缩略图',
  `icon` varchar(20) DEFAULT '' COMMENT '分类图标',
  `template` varchar(50) NOT NULL DEFAULT '' COMMENT '分类模板',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '分类类型  1  列表  2 单页',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of think_category
-- ----------------------------
INSERT INTO `think_category` VALUES ('1', '0', 'thinkphp', '', '<p>thinkphp</p>', '', '', '', '1', '4');
INSERT INTO `think_category` VALUES ('2', '0', '.NET技术', '', '<p>.NET技术</p>', '', '', '', '1', '2');
INSERT INTO `think_category` VALUES ('3', '0', '学习笔记', '', '<p>学习笔记</p>', '', '', '', '1', '1');
INSERT INTO `think_category` VALUES ('4', '0', 'PHP技术', '', '<p>PHP技术</p>', '', '', '', '1', '3');

-- ----------------------------
-- Table structure for `think_guestbook`
-- ----------------------------
DROP TABLE IF EXISTS `think_guestbook`;
CREATE TABLE `think_guestbook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT '0' COMMENT '发布者ID',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `content` longtext COMMENT '留言内容',
  `userip` varchar(255) DEFAULT NULL COMMENT 'IP',
  `os` varchar(50) DEFAULT NULL COMMENT '操作系统',
  `position` varchar(100) DEFAULT NULL COMMENT '所在位置',
  `headimgurl` varchar(255) DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态  1 正常  2 禁止',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `replycontent` longtext COMMENT '回复内容',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of think_guestbook
-- ----------------------------
INSERT INTO `think_guestbook` VALUES ('53', '5', 'Style', '效果杆杆的', null, 'windows', '广东广州', 'http://qzapp.qlogo.cn/qzapp/101258055/AD7E93DA25EB36F6E5657184705A323C/100', '1', '2016-12-22 21:14:54', null, 'ddd@163.com');
INSERT INTO `think_guestbook` VALUES ('52', '7', '概念', '感觉美美哒！', null, 'windows', '广东广州', 'http://qzapp.qlogo.cn/qzapp/101258055/EAE7120CAF6C9FCF57D95BB1072CDF55/100', '1', '2016-12-22 18:12:04', null, 'kkk@163.com');
INSERT INTO `think_guestbook` VALUES ('51', '5', 'Style', '测试下留言效果', null, 'windows', '广东省广州市', 'http://qzapp.qlogo.cn/qzapp/101258055/AD7E93DA25EB36F6E5657184705A323C/100', '1', '2016-12-22 16:55:02', null, '25845555@qq.com');
INSERT INTO `think_guestbook` VALUES ('54', '5', 'Style', '让我说点什么好呢？', null, 'windows', '广东广州', 'http://qzapp.qlogo.cn/qzapp/101258055/AD7E93DA25EB36F6E5657184705A323C/100', '1', '2016-12-23 11:23:00', null, '225@qq.com');

-- ----------------------------
-- Table structure for `think_links`
-- ----------------------------
DROP TABLE IF EXISTS `think_links`;
CREATE TABLE `think_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `linkname` varchar(50) NOT NULL DEFAULT '' COMMENT '链接名称',
  `linkurl` varchar(50) NOT NULL DEFAULT '' COMMENT '镕接地址',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态  1 正常  2 禁止',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of think_links
-- ----------------------------
INSERT INTO `think_links` VALUES ('2', '百度', 'http://www.baidu.com', '1', '2016-12-15 15:39:29');
INSERT INTO `think_links` VALUES ('3', 'thinkphp', 'http://www.thinkphp.cn/', '1', '2016-12-22 16:37:52');

-- ----------------------------
-- Table structure for `think_nav`
-- ----------------------------
DROP TABLE IF EXISTS `think_nav`;
CREATE TABLE `think_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL COMMENT '父ID',
  `name` varchar(20) NOT NULL COMMENT '导航名称',
  `alias` varchar(20) DEFAULT '' COMMENT '导航别称',
  `link` varchar(255) DEFAULT '' COMMENT '导航链接',
  `icon` varchar(255) DEFAULT '' COMMENT '导航图标',
  `target` varchar(10) DEFAULT '' COMMENT '打开方式',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态  0 隐藏  1 显示',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='导航表';

-- ----------------------------
-- Records of think_nav
-- ----------------------------
INSERT INTO `think_nav` VALUES ('1', '0', '说说', '', 'tell', '', '_self', '1', '0');
INSERT INTO `think_nav` VALUES ('2', '0', '留言板', '', 'gb', '', '_self', '1', '0');
INSERT INTO `think_nav` VALUES ('3', '0', '访客', '', 'fk', '', '_self', '1', '0');

-- ----------------------------
-- Table structure for `think_system`
-- ----------------------------
DROP TABLE IF EXISTS `think_system`;
CREATE TABLE `think_system` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '配置项名称',
  `value` text NOT NULL COMMENT '配置项值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- ----------------------------
-- Records of think_system
-- ----------------------------
INSERT INTO `think_system` VALUES ('1', 'site_config', 'a:8:{s:10:\"site_title\";s:12:\"唯美博客\";s:9:\"seo_title\";s:12:\"唯美博客\";s:11:\"seo_keyword\";s:12:\"唯美博客\";s:15:\"seo_description\";s:12:\"唯美博客\";s:10:\"admin_page\";s:2:\"15\";s:14:\"site_copyright\";s:12:\"唯美博客\";s:8:\"site_icp\";s:15:\"粤ICP:25545455\";s:11:\"site_tongji\";s:6:\"统计\";}');

-- ----------------------------
-- Table structure for `think_tags`
-- ----------------------------
DROP TABLE IF EXISTS `think_tags`;
CREATE TABLE `think_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num` int(11) DEFAULT '0' COMMENT '数量',
  `tagname` varchar(255) DEFAULT '' COMMENT 'Tage名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of think_tags
-- ----------------------------
INSERT INTO `think_tags` VALUES ('70', '1', '兼容手机', '2016-12-22 17:09:23');
INSERT INTO `think_tags` VALUES ('68', '1', 'bootstrap', '2016-12-22 17:09:23');
INSERT INTO `think_tags` VALUES ('66', '3', 'php', '2016-12-22 16:51:35');
INSERT INTO `think_tags` VALUES ('67', '1', 'ThinkPHP', '2016-12-22 17:09:23');
INSERT INTO `think_tags` VALUES ('69', '1', '响应式', '2016-12-22 17:09:23');
INSERT INTO `think_tags` VALUES ('65', '1', '中文分词', '2016-12-22 16:44:07');
INSERT INTO `think_tags` VALUES ('71', '1', 'QQ互联', '2016-12-22 17:09:23');
INSERT INTO `think_tags` VALUES ('72', '1', '格式化', '2016-12-22 17:09:52');
INSERT INTO `think_tags` VALUES ('73', '3', 'Apache', '2016-12-22 17:19:29');
INSERT INTO `think_tags` VALUES ('74', '3', '伪静态', '2016-12-22 17:19:29');

-- ----------------------------
-- Table structure for `think_tell`
-- ----------------------------
DROP TABLE IF EXISTS `think_tell`;
CREATE TABLE `think_tell` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tellid` int(11) DEFAULT '0' COMMENT '发布者ID',
  `tellcontent` longtext COMMENT '说说内容',
  `os` varchar(50) DEFAULT NULL COMMENT '操作系统',
  `position` varchar(100) DEFAULT NULL COMMENT '所在位置',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态  1 正常  2 禁止',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of think_tell
-- ----------------------------
INSERT INTO `think_tell` VALUES ('38', '1', '&lt;p&gt;&lt;span&gt;本博客QQ快速登陆,无需申请QQ互联,也不需要任何配置就能用QQ快速登陆博客&lt;/span&gt;&lt;/p&gt;', 'windows', '广东省广州市', '1', '2016-12-22 17:11:39');
INSERT INTO `think_tell` VALUES ('37', '1', '由于时间的原因，&lt;img src=&quot;http://blog.100ncanyin.com/public/static/layui/images/face/7.gif&quot; alt=&quot;[害羞]&quot;&gt;博客的模板是仿别人呵呵', 'windows', '广东省广州市', '1', '2016-12-22 16:59:31');
INSERT INTO `think_tell` VALUES ('36', '1', '&lt;img src=&quot;http://blog.100ncanyin.com/public/static/layui/images/face/25.gif&quot; alt=&quot;[抱抱]&quot;&gt;唯美博客开源了，源码已传到QQ群文件，有需要的加一下QQ群', 'windows', '广东省广州市', '1', '2016-12-22 16:58:35');
INSERT INTO `think_tell` VALUES ('35', '1', '&lt;p&gt;今天心情不错，采用thinkphp开发的第一个blog已完成！稍后会开源免费给大家使用！&lt;img src=&quot;http://blog.100ncanyin.com/public/static/layui/images/face/0.gif&quot; alt=&quot;[微笑]&quot;&gt;&lt;/p&gt;', 'windows', '广东省广州市', '1', '2016-12-22 16:56:37');
INSERT INTO `think_tell` VALUES ('39', '1', '&lt;img src=&quot;http://blog.100ncanyin.com/public/static/layui/images/face/39.gif&quot; alt=&quot;[鼓掌]&quot;&gt;今天广州天气真好，没有雾霾的空气真爽大爱广州', 'windows', '广东省广州市', '1', '2016-12-22 17:12:23');
INSERT INTO `think_tell` VALUES ('40', '1', '&lt;img src=&quot;http://blog.100ncanyin.com/public/static/layui/images/face/27.gif&quot; alt=&quot;[疑问]&quot;&gt;一年一度的抢票盛宴又开始了！哎你抢到了吗！', 'windows', '广东省广州市', '1', '2016-12-22 17:13:14');

-- ----------------------------
-- Table structure for `think_user`
-- ----------------------------
DROP TABLE IF EXISTS `think_user`;
CREATE TABLE `think_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(100) DEFAULT NULL COMMENT 'QQ登陆用户的识别码',
  `username` varchar(50) DEFAULT '' COMMENT '用户名',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `mobile` varchar(11) DEFAULT '' COMMENT '手机',
  `email` varchar(50) DEFAULT '' COMMENT '邮箱',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `headimgurl` varchar(255) DEFAULT NULL COMMENT '头像',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态  1 正常  2 禁止',
  `logincount` int(10) DEFAULT '0' COMMENT 'logincount',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `last_login_ip` varchar(50) DEFAULT '' COMMENT '最后登录IP',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of think_user
-- ----------------------------
INSERT INTO `think_user` VALUES ('5', 'AD7E93DA25EB36F6E5657184705A323C', '', '', '', '', 'Style', 'http://qzapp.qlogo.cn/qzapp/101258055/AD7E93DA25EB36F6E5657184705A323C/100', '1', null, '2016-12-22 14:52:43', '2016-12-23 19:08:14', '218.20.159.62');
INSERT INTO `think_user` VALUES ('6', 'AF0CC38C81A80B3A17F6473592295DB5', '', '', '', '', 'V5', 'http://qzapp.qlogo.cn/qzapp/101258055/AF0CC38C81A80B3A17F6473592295DB5/100', '1', null, '2016-12-22 17:44:32', '2016-12-26 13:48:30', '218.20.158.26');
INSERT INTO `think_user` VALUES ('7', 'EAE7120CAF6C9FCF57D95BB1072CDF55', '', '', '', '', '概念', 'http://qzapp.qlogo.cn/qzapp/101258055/EAE7120CAF6C9FCF57D95BB1072CDF55/100', '1', null, '2016-12-22 17:53:48', '2016-12-22 21:30:58', '218.20.159.62');
INSERT INTO `think_user` VALUES ('8', 'EC116A9C109F8D0254826E38AD9660F9', '', '', '', '', '哦7)蒲也xJ|e5', 'http://qzapp.qlogo.cn/qzapp/101258055/EC116A9C109F8D0254826E38AD9660F9/100', '1', '1', '2016-12-23 19:09:01', '2016-12-24 14:22:16', '218.20.159.62');
INSERT INTO `think_user` VALUES ('9', '9498257D7A9462BF7887AFD5579613DC', '', '', '', '', '染的人', 'http://qzapp.qlogo.cn/qzapp/101258055/9498257D7A9462BF7887AFD5579613DC/100', '1', '0', '2016-12-26 13:54:11', '2016-12-26 13:54:11', '14.211.203.103');
INSERT INTO `think_user` VALUES ('10', '5A1CD87DA02471140895C65F2456E245', '', '', '', '', '没有人比時間更懂得珍惜', 'http://qzapp.qlogo.cn/qzapp/101258055/5A1CD87DA02471140895C65F2456E245/100', '1', '1', '2016-12-26 13:59:04', '2016-12-26 14:00:39', '222.89.97.110');
INSERT INTO `think_user` VALUES ('11', '4BB1483FEDE9D42B383F5BC160911936', '', '', '', '', '倾城笑丶', 'http://qzapp.qlogo.cn/qzapp/101258055/4BB1483FEDE9D42B383F5BC160911936/100', '1', '0', '2016-12-26 14:08:58', '2016-12-26 14:08:58', '58.61.66.68');
INSERT INTO `think_user` VALUES ('12', '0FC2C0B97E99F90B2C1FDD81F7285FA1', '', '', '', '', '谁与寄千里', 'http://qzapp.qlogo.cn/qzapp/101258055/0FC2C0B97E99F90B2C1FDD81F7285FA1/100', '1', '0', '2016-12-26 14:15:55', '2016-12-26 14:15:55', '114.225.49.170');
INSERT INTO `think_user` VALUES ('13', '2DC8502533311E7D591F721922305B3C', '', '', '', '', '勿忘心安', 'http://qzapp.qlogo.cn/qzapp/101258055/2DC8502533311E7D591F721922305B3C/100', '1', '1', '2016-12-26 14:40:20', '2016-12-26 14:40:35', '180.153.214.178');
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        