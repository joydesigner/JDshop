-- --------------------------------------------------------

--
-- 表的结构 `jd_ad`
--
CREATE DATABASE IF NOT EXISTS jdshop CHARSET=UTF8;

GRANT ALL on jdshop.* to jdshop@'localhost' identified by 'jdshop';

USE jdshop;

DROP TABLE IF EXISTS `jd_ad`;
CREATE TABLE `jd_ad` (
  `ad_id` smallint(5) unsigned NOT NULL auto_increment,
  `position_id` smallint unsigned NOT NULL default '0',
  `media_type` tinyint(3) unsigned NOT NULL default '0',
  `ad_name` varchar(60) NOT NULL default '',
  `ad_link` varchar(255) NOT NULL default '',
  `ad_code` text NOT NULL,
  `start_time` int(11) NOT NULL default '0',
  `end_time` int(11) NOT NULL default '0',
  `link_man` varchar(60) NOT NULL default '',
  `link_email` varchar(60) NOT NULL default '',
  `link_phone` varchar(60) NOT NULL default '',
  `click_count` mediumint(8) unsigned NOT NULL default '0',
  `enabled` tinyint(3) unsigned NOT NULL default '1',
  PRIMARY KEY  (`ad_id`),
  KEY `position_id` (`position_id`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_ad_position`
--

DROP TABLE IF EXISTS `jd_ad_position`;
CREATE TABLE `jd_ad_position` (
  `position_id` tinyint(3) unsigned NOT NULL auto_increment,
  `position_name` varchar(60) NOT NULL default '',
  `ad_width` smallint(5) unsigned NOT NULL default '0',
  `ad_height` smallint(5) unsigned NOT NULL default '0',
  `position_desc` varchar(255) NOT NULL default '',
  `position_style` text NOT NULL,
  PRIMARY KEY  (`position_id`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_admin_action`
--

DROP TABLE IF EXISTS `jd_admin_action`;
CREATE TABLE `jd_admin_action` (
  `action_id` tinyint(3) unsigned NOT NULL auto_increment,
  `parent_id` tinyint(3) unsigned NOT NULL default '0',
  `action_code` varchar(20) NOT NULL default '',
  `relevance` varchar(20) NOT NULL default '',
  PRIMARY KEY  (`action_id`),
  KEY `parent_id` (`parent_id`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_admin_log`
--

DROP TABLE IF EXISTS `jd_admin_log`;
CREATE TABLE `jd_admin_log` (
  `log_id` int(10) unsigned NOT NULL auto_increment,
  `log_time` int(10) unsigned NOT NULL default '0',
  `user_id` tinyint(3) unsigned NOT NULL default '0',
  `log_info` varchar(255) NOT NULL default '',
  `ip_address` varchar(15) NOT NULL default '',
  PRIMARY KEY  (`log_id`),
  KEY `log_time` (`log_time`),
  KEY `user_id` (`user_id`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_admin_message`
--

DROP TABLE IF EXISTS `jd_admin_message`;
CREATE TABLE `jd_admin_message` (
  `message_id` smallint(5) unsigned NOT NULL auto_increment,
  `sender_id` tinyint(3) unsigned NOT NULL default '0',
  `receiver_id` tinyint(3) unsigned NOT NULL default '0',
  `sent_time` int(11) unsigned NOT NULL default '0',
  `read_time` int(11) unsigned NOT NULL default '0',
  `readed` tinyint(1) unsigned NOT NULL default '0',
  `deleted` tinyint(1) unsigned NOT NULL default '0',
  `title` varchar(150) NOT NULL default '',
  `message` text NOT NULL,
  PRIMARY KEY  (`message_id`),
  KEY `sender_id` (`sender_id`,`receiver_id`),
  KEY `receiver_id` (`receiver_id`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_admin_user`
--

DROP TABLE IF EXISTS `jd_admin_user`;
CREATE TABLE `jd_admin_user` (
  `user_id` smallint(5) unsigned NOT NULL auto_increment,
  `user_name` varchar(60) NOT NULL default '',
  `email` varchar(60) NOT NULL default '',
  `password` varchar(32) NOT NULL default '',
  `ec_salt` VARCHAR( 10 )  NULL,
  `add_time` int(11) NOT NULL default '0',
  `last_login` int(11) NOT NULL default '0',
  `last_ip` varchar(15) NOT NULL default '',
  `action_list` text NOT NULL,
  `nav_list` text NOT NULL,
  `lang_type` varchar(50) NOT NULL default '',
  `agency_id` smallint(5) unsigned NOT NULL,
  `suppliers_id` smallint(5) unsigned default '0',
  `todolist` LONGTEXT NULL,
  `role_id` smallint(5) default NULL,
  PRIMARY KEY  (`user_id`),
  KEY `user_name` (`user_name`),
  KEY `agency_id` (`agency_id`)
) ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_adsense`
--

DROP TABLE IF EXISTS `jd_adsense`;
CREATE TABLE `jd_adsense` (
  `from_ad` smallint(5) NOT NULL default '0',
  `referer` varchar(255) NOT NULL default '',
  `clicks` int(10) unsigned NOT NULL default '0',
  KEY `from_ad` (`from_ad`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_area_region`
--

DROP TABLE IF EXISTS `jd_area_region`;
CREATE TABLE `jd_area_region` (
  `shipping_area_id` smallint(5) unsigned NOT NULL default '0',
  `region_id` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`shipping_area_id`,`region_id`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_article`
--

DROP TABLE IF EXISTS `jd_article`;
CREATE TABLE `jd_article` (
  `article_id` mediumint(8) unsigned NOT NULL auto_increment,
  `cat_id` smallint(5) NOT NULL default '0',
  `title` varchar(150) NOT NULL default '',
  `content` longtext NOT NULL,
  `author` varchar(30) NOT NULL default '',
  `author_email` varchar(60) NOT NULL default '',
  `keywords` varchar(255) NOT NULL default '',
  `article_type` tinyint(1) unsigned NOT NULL default '2',
  `is_open` tinyint(1) unsigned NOT NULL default '1',
  `add_time` int(10) unsigned NOT NULL default '0',
  `file_url` varchar(255) NOT NULL default '',
  `open_type` tinyint(1) unsigned NOT NULL default '0',
  `link` varchar(255) NOT NULL default '',
  `description` varchar(255) default NULL,
  PRIMARY KEY  (`article_id`),
  KEY `cat_id` (`cat_id`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_article_cat`
--

DROP TABLE IF EXISTS `jd_article_cat`;
CREATE TABLE `jd_article_cat` (
  `cat_id` smallint(5) NOT NULL auto_increment,
  `cat_name` varchar(255) NOT NULL default '',
  `cat_type` tinyint(1) unsigned NOT NULL default '1',
  `keywords` varchar(255) NOT NULL default '',
  `cat_desc` varchar(255) NOT NULL default '',
  `sort_order` tinyint(3) unsigned NOT NULL default '50',
  `show_in_nav` tinyint(1) unsigned NOT NULL default '0',
  `parent_id` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`cat_id`),
  KEY `cat_type` (`cat_type`),
  KEY `sort_order` (`sort_order`),
  KEY `parent_id` (`parent_id`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_attribute`
--

DROP TABLE IF EXISTS `jd_attribute`;
CREATE TABLE `jd_attribute` (
  `attr_id` smallint(5) unsigned NOT NULL auto_increment,
  `cat_id` smallint(5) unsigned NOT NULL default '0',
  `attr_name` varchar(60) NOT NULL default '',
  `attr_input_type` tinyint(1) unsigned NOT NULL default '1',
  `attr_type` tinyint(1) unsigned NOT NULL default '1',
  `attr_values` text NOT NULL,
  `attr_index` tinyint(1) unsigned NOT NULL default '0',
  `sort_order` tinyint(3) unsigned NOT NULL default '0',
  `is_linked` tinyint(1) unsigned NOT NULL default '0',
  `attr_group` tinyint( 1 ) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY  (`attr_id`),
  KEY `cat_id` (`cat_id`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_bonus_type`
--

DROP TABLE IF EXISTS `jd_bonus_type`;
CREATE TABLE `jd_bonus_type` (
  `type_id` smallint unsigned NOT NULL auto_increment,
  `type_name` varchar(60) NOT NULL default '',
  `type_money` decimal(10,2) NOT NULL default '0.00',
  `send_type` tinyint(3) unsigned NOT NULL default '0',
  `min_amount` decimal(10,2) unsigned NOT NULL default '0.00',
  `max_amount` decimal(10,2) unsigned NOT NULL default '0.00',
  `send_start_date` int(11) NOT NULL default '0',
  `send_end_date` int(11) NOT NULL default '0',
  `use_start_date` int(11) NOT NULL default '0',
  `use_end_date` int(11) NOT NULL default '0',
  `min_goods_amount` decimal(10,2) unsigned NOT NULL default '0.00',
  PRIMARY KEY  (`type_id`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_booking_goods`
--

DROP TABLE IF EXISTS `jd_booking_goods`;
CREATE TABLE `jd_booking_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `email` varchar(60) NOT NULL default '',
  `link_man` varchar(60) NOT NULL default '',
  `tel` varchar(60) NOT NULL default '',
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `goods_desc` varchar(255) NOT NULL default '',
  `goods_number` smallint(5) unsigned NOT NULL default '0',
  `booking_time` int(10) unsigned NOT NULL default '0',
  `is_dispose` tinyint(1) unsigned NOT NULL default '0',
  `dispose_user` varchar(30) NOT NULL default '',
  `dispose_time` int(10) unsigned NOT NULL default '0',
  `dispose_note` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`rec_id`),
  KEY `user_id` (`user_id`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_brand`
--

DROP TABLE IF EXISTS `jd_brand`;
CREATE TABLE `jd_brand` (
  `brand_id` smallint(5) unsigned NOT NULL auto_increment,
  `brand_name` varchar(60) NOT NULL default '',
  `brand_logo` varchar(80) NOT NULL default '',
  `brand_desc` text NOT NULL,
  `site_url` varchar(255) NOT NULL default '',
  `sort_order` tinyint(3) unsigned NOT NULL default '50',
  `is_show` tinyint( 1 ) unsigned NOT NULL default '1',
  PRIMARY KEY  (`brand_id`),
  KEY `is_show` (`is_show`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_card`
--

DROP TABLE IF EXISTS `jd_card`;
CREATE TABLE `jd_card` (
  `card_id` tinyint(3) unsigned NOT NULL auto_increment,
  `card_name` varchar(120) NOT NULL default '',
  `card_img` varchar(255) NOT NULL default '',
  `card_fee` decimal(6,2) unsigned NOT NULL default '0.00',
  `free_money` decimal(6,2) unsigned NOT NULL default '0.00',
  `card_desc` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`card_id`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_cart`
--

DROP TABLE IF EXISTS `jd_cart`;
CREATE TABLE `jd_cart` (
  `rec_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `session_id` char(32) binary NOT NULL default '',
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `goods_sn` varchar(60) NOT NULL default '',
  `product_id` mediumint(8) unsigned NOT NULL default '0',
  `goods_name` varchar(120) NOT NULL default '',
  `market_price` decimal(10,2) unsigned NOT NULL default '0.00',
  `goods_price` decimal(10,2) NOT NULL default '0.00',
  `goods_number` smallint(5) unsigned NOT NULL default '0',
  `goods_attr` text NOT NULL,
  `is_real` tinyint(1) unsigned NOT NULL default '0',
  `extension_code` varchar(30) NOT NULL default '',
  `parent_id` mediumint(8) unsigned NOT NULL default '0',
  `rec_type` tinyint(1) unsigned NOT NULL default '0',
  `is_gift` smallint unsigned NOT NULL default '0',
  `is_shipping` tinyint(1) unsigned NOT NULL default '0',
  `can_handsel` tinyint(3) unsigned NOT NULL default '0',
  `goods_attr_id` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`rec_id`),
  KEY `session_id` (`session_id`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_category`
--

DROP TABLE IF EXISTS `jd_category`;
CREATE TABLE `jd_category` (
  `cat_id` smallint(5) unsigned NOT NULL auto_increment,
  `cat_name` varchar(90) NOT NULL default '',
  `keywords` varchar(255) NOT NULL default '',
  `cat_desc` varchar(255) NOT NULL default '',
  `parent_id` smallint(5) unsigned NOT NULL default '0',
  `sort_order` tinyint(1) unsigned NOT NULL default '50',
  `template_file` varchar(50) NOT NULL default '',
  `measure_unit` varchar(15) NOT NULL default '',
  `show_in_nav` tinyint(1) NOT NULL default '0',
  `style` varchar( 150 ) NOT NULL,
  `is_show` tinyint(1) unsigned NOT NULL default '1',
  `grade` tinyint(4) NOT NULL default '0',
  `filter_attr` varchar(255) NOT NULL default '0',
  PRIMARY KEY  (`cat_id`),
  KEY `parent_id` (`parent_id`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_collect_goods`
--

DROP TABLE IF EXISTS `jd_collect_goods`;
CREATE TABLE `jd_collect_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `add_time` int(11) unsigned NOT NULL default '0',
  `is_attention` TINYINT( 1 ) NOT NULL DEFAULT '0',
  PRIMARY KEY  (`rec_id`),
  KEY `user_id` (`user_id`),
  KEY `goods_id` (`goods_id`),
  KEY `is_attention` (`is_attention`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_comment`
--

DROP TABLE IF EXISTS `jd_comment`;
CREATE TABLE `jd_comment` (
  `comment_id` int(10) unsigned NOT NULL auto_increment,
  `comment_type` tinyint(3) unsigned NOT NULL default '0',
  `id_value` mediumint(8) unsigned NOT NULL default '0',
  `email` varchar(60) NOT NULL default '',
  `user_name` varchar(60) NOT NULL default '',
  `content` text NOT NULL,
  `comment_rank` tinyint(1) unsigned NOT NULL default '0',
  `add_time` int(10) unsigned NOT NULL default '0',
  `ip_address` varchar(15) NOT NULL default '',
  `status` tinyint(3) unsigned NOT NULL default '0',
  `parent_id` int(10) unsigned NOT NULL default '0',
  `user_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`comment_id`),
  KEY `parent_id` (`parent_id`),
  KEY `id_value` (`id_value`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_crons`
--

DROP TABLE IF EXISTS `jd_crons`;
CREATE TABLE `jd_crons` (
  `cron_id` tinyint(3) unsigned NOT NULL auto_increment,
  `cron_code` varchar(20) NOT NULL,
  `cron_name` varchar(120) NOT NULL,
  `cron_desc` text,
  `cron_order` tinyint(3) unsigned NOT NULL default '0',
  `cron_config` text NOT NULL,
  `thistime` int(10) NOT NULL default '0',
  `nextime` int(10) NOT NULL,
  `day` tinyint(2) NOT NULL,
  `week` varchar(1) NOT NULL,
  `hour` varchar(2) NOT NULL,
  `minute` varchar(255) NOT NULL,
  `enable` tinyint(1) NOT NULL default '1',
  `run_once` tinyint(1) NOT NULL default '0',
  `allow_ip` varchar(100) NOT NULL default '',
  `alow_files` varchar(255) NOT NULL,
  PRIMARY KEY  (`cron_id`),
  KEY `nextime` (`nextime`),
  KEY `enable` (`enable`),
  KEY `cron_code` (`cron_code`)
) ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_error_log`
--

DROP TABLE IF EXISTS `jd_error_log`;
CREATE TABLE `jd_error_log` (
  `id` int(10) NOT NULL auto_increment,
  `info` varchar(255) NOT NULL,
  `file` varchar(100) NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `time` (`time`)
) ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_feedback`
--

DROP TABLE IF EXISTS `jd_feedback`;
CREATE TABLE `jd_feedback` (
  `msg_id` mediumint(8) unsigned NOT NULL auto_increment,
  `parent_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `user_name` varchar(60) NOT NULL default '',
  `user_email` varchar(60) NOT NULL default '',
  `msg_title` varchar(200) NOT NULL default '',
  `msg_type` tinyint(1) unsigned NOT NULL default '0',
  `msg_status` tinyint( 1 ) unsigned NOT NULL DEFAULT '0',
  `msg_content` text NOT NULL,
  `msg_time` int(10) unsigned NOT NULL default '0',
  `message_img` varchar(255) NOT NULL default '0',
  `order_id` int(11) unsigned NOT NULL default '0',
  `msg_area` TINYINT(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`msg_id`),
  KEY `user_id` (`user_id`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_friend_link`
--

DROP TABLE IF EXISTS `jd_friend_link`;
CREATE TABLE `jd_friend_link` (
  `link_id` smallint(5) unsigned NOT NULL auto_increment,
  `link_name` varchar(255) NOT NULL default '',
  `link_url` varchar(255) NOT NULL default '',
  `link_logo` varchar(255) NOT NULL default '',
  `show_order` tinyint(3) unsigned NOT NULL default '50',
  PRIMARY KEY  (`link_id`),
  KEY `show_order` (`show_order`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_goods`
--

DROP TABLE IF EXISTS `jd_goods`;
CREATE TABLE `jd_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL auto_increment,
  `cat_id` smallint(5) unsigned NOT NULL default '0',
  `goods_sn` varchar(60) NOT NULL default '',
  `goods_name` varchar(120) NOT NULL default '',
  `goods_name_style` varchar(60) NOT NULL default '+',
  `click_count` int(10) unsigned NOT NULL default '0',
  `brand_id` smallint(5) unsigned NOT NULL default '0',
  `provider_name` varchar(100) NOT NULL default '',
  `goods_number` smallint(5) unsigned NOT NULL default '0',
  `goods_weight` decimal(10,3) unsigned NOT NULL default '0.000',
  `market_price` decimal(10,2) unsigned NOT NULL default '0.00',
  `shop_price` decimal(10,2) unsigned NOT NULL default '0.00',
  `promote_price` decimal(10,2) unsigned NOT NULL default '0.00',
  `promote_start_date` int(11) unsigned NOT NULL default '0',
  `promote_end_date` int(11) unsigned NOT NULL default '0',
  `warn_number` tinyint(3) unsigned NOT NULL default '1',
  `keywords` varchar(255) NOT NULL default '',
  `goods_brief` varchar(255) NOT NULL default '',
  `goods_desc` text NOT NULL,
  `goods_thumb` varchar(255) NOT NULL default '',
  `goods_img` varchar(255) NOT NULL default '',
  `original_img` varchar(255) NOT NULL default '',
  `is_real` tinyint(3) unsigned NOT NULL default '1',
  `extension_code` varchar(30) NOT NULL default '',
  `is_on_sale` tinyint(1) unsigned NOT NULL default '1',
  `is_alone_sale` tinyint(1) unsigned NOT NULL default '1',
  `is_shipping` tinyint(1) unsigned NOT NULL default '0',
  `integral` int unsigned NOT NULL default '0',
  `add_time` int(10) unsigned NOT NULL default '0',
  `sort_order` smallint(4) unsigned NOT NULL default '100',
  `is_delete` tinyint(1) unsigned NOT NULL default '0',
  `is_best` tinyint(1) unsigned NOT NULL default '0',
  `is_new` tinyint(1) unsigned NOT NULL default '0',
  `is_hot` tinyint(1) unsigned NOT NULL default '0',
  `is_promote` tinyint(1) unsigned NOT NULL default '0',
  `bonus_type_id` tinyint(3) unsigned NOT NULL default '0',
  `last_update` int(10) unsigned NOT NULL default '0',
  `goods_type` smallint(5) unsigned NOT NULL default '0',
  `seller_note` varchar(255) NOT NULL default '',
  `give_integral` int NOT NULL default '-1',
  `rank_integral` int NOT NULL default '-1',
  `suppliers_id` smallint(5) unsigned default NULL,
  `is_check` tinyint(1) unsigned default NULL,
  PRIMARY KEY  (`goods_id`),
  KEY `goods_sn` (`goods_sn`),
  KEY `cat_id` (`cat_id`),
  KEY `last_update` (`last_update`),
  KEY `brand_id` (`brand_id`),
  KEY `goods_weight` (`goods_weight`),
  KEY `promote_end_date` (`promote_end_date`),
  KEY `promote_start_date` (`promote_start_date`),
  KEY `goods_number` (`goods_number`),
  KEY `sort_order` (`sort_order`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_goods_article`
--

DROP TABLE IF EXISTS `jd_goods_article`;
CREATE TABLE `jd_goods_article` (
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `article_id` mediumint(8) unsigned NOT NULL default '0',
  `admin_id` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`goods_id`,`article_id`,`admin_id`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_goods_attr`
--

DROP TABLE IF EXISTS `jd_goods_attr`;
CREATE TABLE `jd_goods_attr` (
  `goods_attr_id` int(10) unsigned NOT NULL auto_increment,
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `attr_id` smallint(5) unsigned NOT NULL default '0',
  `attr_value` text NOT NULL,
  `attr_price` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`goods_attr_id`),
  KEY `goods_id` (`goods_id`),
  KEY `attr_id` (`attr_id`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_goods_cat`
--

DROP TABLE IF EXISTS `jd_goods_cat`;
CREATE TABLE `jd_goods_cat` (
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `cat_id` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`goods_id`,`cat_id`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_goods_gallery`
--

DROP TABLE IF EXISTS `jd_goods_gallery`;
CREATE TABLE `jd_goods_gallery` (
  `img_id` mediumint(8) unsigned NOT NULL auto_increment,
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `img_url` varchar(255) NOT NULL default '',
  `img_desc` varchar(255) NOT NULL default '',
  `thumb_url` varchar(255) NOT NULL default '',
  `img_original` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`img_id`),
  KEY `goods_id` (`goods_id`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_goods_type`
--

DROP TABLE IF EXISTS `jd_goods_type`;
CREATE TABLE `jd_goods_type` (
  `cat_id` smallint(5) unsigned NOT NULL auto_increment,
  `cat_name` varchar(60) NOT NULL default '',
  `enabled` tinyint(1) unsigned NOT NULL default '1',
  `attr_group` VARCHAR( 255 ) NOT NULL,
  PRIMARY KEY  (`cat_id`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_group_goods`
--

DROP TABLE IF EXISTS `jd_group_goods`;
CREATE TABLE `jd_group_goods` (
  `parent_id` mediumint(8) unsigned NOT NULL default '0',
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `goods_price` decimal(10,2) unsigned NOT NULL default '0.00',
  `admin_id` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`parent_id`,`goods_id`,`admin_id`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_link_goods`
--

DROP TABLE IF EXISTS `jd_link_goods`;
CREATE TABLE `jd_link_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `link_goods_id` mediumint(8) unsigned NOT NULL default '0',
  `is_double` tinyint(1) unsigned NOT NULL default '0',
  `admin_id` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`goods_id`,`link_goods_id`,`admin_id`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_mail_templates`
--

DROP TABLE IF EXISTS `jd_mail_templates`;
CREATE TABLE `jd_mail_templates` (
  `template_id` tinyint(1) unsigned NOT NULL auto_increment,
  `template_code` varchar(30) NOT NULL default '',
  `is_html` tinyint(1) unsigned NOT NULL default '0',
  `template_subject` varchar(200) NOT NULL default '',
  `template_content` text NOT NULL,
  `last_modify` int(10) unsigned NOT NULL default '0',
  `last_send` int(10) unsigned NOT NULL default '0',
  `type` varchar(10) NOT NULL,
  PRIMARY KEY  (`template_id`),
  UNIQUE (`template_code`),
  KEY `type` (`type`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_member_price`
--

DROP TABLE IF EXISTS `jd_member_price`;
CREATE TABLE `jd_member_price` (
  `price_id` mediumint(8) unsigned NOT NULL auto_increment,
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `user_rank` tinyint(3) NOT NULL default '0',
  `user_price` decimal(10,2) NOT NULL default '0.00',
  PRIMARY KEY  (`price_id`),
  KEY `goods_id` (`goods_id`,`user_rank`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_keywords`
--

DROP TABLE IF EXISTS `jd_keywords`;
CREATE TABLE `jd_keywords` (
  `date` date NOT NULL default '0000-00-00',
  `searchengine` varchar(20) NOT NULL default '',
  `keyword` varchar(90) NOT NULL default '',
  `count` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`date`,`searchengine`,`keyword`)
) ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_order_action`
--

DROP TABLE IF EXISTS `jd_order_action`;
CREATE TABLE `jd_order_action` (
  `action_id` mediumint(8) unsigned NOT NULL auto_increment,
  `order_id` mediumint(8) unsigned NOT NULL default '0',
  `action_user` varchar(30) NOT NULL default '',
  `order_status` tinyint(1) unsigned NOT NULL default '0',
  `shipping_status` tinyint(1) unsigned NOT NULL default '0',
  `pay_status` tinyint(1) unsigned NOT NULL default '0',
  `action_place` TINYINT( 1 ) UNSIGNED NOT NULL default '0',
  `action_note` varchar(255) NOT NULL default '',
  `log_time` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`action_id`),
  KEY `order_id` (`order_id`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_order_goods`
--

DROP TABLE IF EXISTS `jd_order_goods`;
CREATE TABLE `jd_order_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL auto_increment,
  `order_id` mediumint(8) unsigned NOT NULL default '0',
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `goods_name` varchar(120) NOT NULL default '',
  `goods_sn` varchar(60) NOT NULL default '',
  `product_id` mediumint(8) unsigned NOT NULL default '0',
  `goods_number` smallint(5) unsigned NOT NULL default '1',
  `market_price` decimal(10,2) NOT NULL default '0.00',
  `goods_price` decimal(10,2) NOT NULL default '0.00',
  `goods_attr` text NOT NULL,
  `send_number` smallint(5) unsigned NOT NULL default '0',
  `is_real` tinyint(1) unsigned NOT NULL default '0',
  `extension_code` varchar(30) NOT NULL default '',
  `parent_id` mediumint(8) unsigned NOT NULL default '0',
  `is_gift` smallint unsigned NOT NULL default '0',
  `goods_attr_id` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`rec_id`),
  KEY `order_id` (`order_id`),
  KEY `goods_id` (`goods_id`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_order_info`
--

DROP TABLE IF EXISTS `jd_order_info`;
CREATE TABLE `jd_order_info` (
  `order_id` mediumint(8) unsigned NOT NULL auto_increment,
  `order_sn` varchar(20) NOT NULL default '',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `order_status` tinyint(1) unsigned NOT NULL default '0',
  `shipping_status` tinyint(1) unsigned NOT NULL default '0',
  `pay_status` tinyint(1) unsigned NOT NULL default '0',
  `consignee` varchar(60) NOT NULL default '',
  `country` smallint(5) unsigned NOT NULL default '0',
  `province` smallint(5) unsigned NOT NULL default '0',
  `city` smallint(5) unsigned NOT NULL default '0',
  `district` smallint(5) unsigned NOT NULL default '0',
  `address` varchar(255) NOT NULL default '',
  `zipcode` varchar(60) NOT NULL default '',
  `tel` varchar(60) NOT NULL default '',
  `mobile` varchar(60) NOT NULL default '',
  `email` varchar(60) NOT NULL default '',
  `best_time` varchar(120) NOT NULL default '',
  `sign_building` varchar(120) NOT NULL default '',
  `postscript` varchar(255) NOT NULL default '',
  `shipping_id` tinyint(3) NOT NULL default '0',
  `shipping_name` varchar(120) NOT NULL default '',
  `pay_id` tinyint(3) NOT NULL default '0',
  `pay_name` varchar(120) NOT NULL default '',
  `how_oos` varchar(120) NOT NULL default '',
  `how_surplus` varchar(120) NOT NULL default '',
  `pack_name` varchar(120) NOT NULL default '',
  `card_name` varchar(120) NOT NULL default '',
  `card_message` varchar(255) NOT NULL default '',
  `inv_payee` varchar(120) NOT NULL default '',
  `inv_content` varchar(120) NOT NULL default '',
  `goods_amount` decimal(10,2) NOT NULL default '0.00',
  `shipping_fee` decimal(10,2) NOT NULL default '0.00',
  `insure_fee` DECIMAL( 10, 2 ) NOT NULL DEFAULT '0.00',
  `pay_fee` DECIMAL( 10, 2 ) NOT NULL DEFAULT '0.00',
  `pack_fee` decimal(10,2) NOT NULL default '0.00',
  `card_fee` decimal(10,2) NOT NULL default '0.00',
  `money_paid` decimal(10, 2) NOT NULL default '0.00',
  `surplus` decimal(10,2) NOT NULL default '0.00',
  `integral` int unsigned NOT NULL default '0.00',
  `integral_money` decimal(10,2) NOT NULL default '0.00',
  `bonus` decimal(10,2) NOT NULL default '0.00',
  `order_amount` decimal(10,2) NOT NULL default '0.00',
  `from_ad` smallint(5) NOT NULL default '0',
  `referer` varchar(255) NOT NULL default '',
  `add_time` int(10) unsigned NOT NULL default '0',
  `confirm_time` int(10) unsigned NOT NULL default '0',
  `pay_time` int(10) unsigned NOT NULL default '0',
  `shipping_time` int(10) unsigned NOT NULL default '0',
  `pack_id` tinyint(3) unsigned NOT NULL default '0',
  `card_id` tinyint(3) unsigned NOT NULL default '0',
  `bonus_id` mediumint(8) unsigned NOT NULL default '0',
  `invoice_no` varchar(255) NOT NULL default '',
  `extension_code` varchar(30) NOT NULL default '',
  `extension_id` mediumint(8) unsigned NOT NULL default '0',
  `to_buyer` varchar(255) NOT NULL default '',
  `pay_note` varchar(255) NOT NULL default '',
  `agency_id` smallint(5) unsigned NOT NULL,
  `inv_type` varchar(60) NOT NULL,
  `tax` decimal(10, 2) NOT NULL,
  `is_separate` tinyint(1) NOT NULL default '0',
  `parent_id` mediumint(8) unsigned NOT NULL default '0',
  `discount` decimal(10, 2) NOT NULL,
  PRIMARY KEY  (`order_id`),
  UNIQUE KEY `order_sn` (`order_sn`),
  KEY `user_id` (`user_id`),
  KEY `order_status` (`order_status`),
  KEY `shipping_status` (`shipping_status`),
  KEY `pay_status` (`pay_status`),
  KEY `shipping_id` (`shipping_id`),
  KEY `pay_id` (`pay_id`),
  KEY `extension_code` (`extension_code`,`extension_id`),
  KEY `agency_id` (`agency_id`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_pack`
--

DROP TABLE IF EXISTS `jd_pack`;
CREATE TABLE `jd_pack` (
  `pack_id` tinyint(3) unsigned NOT NULL auto_increment,
  `pack_name` varchar(120) NOT NULL default '',
  `pack_img` varchar(255) NOT NULL default '',
  `pack_fee` decimal(6,2) unsigned NOT NULL default '0',
  `free_money` smallint(5) unsigned NOT NULL default '0',
  `pack_desc` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`pack_id`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_payment`
--

DROP TABLE IF EXISTS `jd_payment`;
CREATE TABLE `jd_payment` (
  `pay_id` tinyint(3) unsigned NOT NULL auto_increment,
  `pay_code` varchar(20) NOT NULL default '',
  `pay_name` varchar(120) NOT NULL default '',
  `pay_fee` VARCHAR( 10 ) NOT NULL DEFAULT '0',
  `pay_desc` text NOT NULL,
  `pay_order` tinyint(3) unsigned NOT NULL default '0',
  `pay_config` text NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL default '0',
  `is_cod` tinyint(1) unsigned NOT NULL default '0',
  `is_online` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`pay_id`),
  UNIQUE KEY `pay_code` (`pay_code`)
)  ENGINE=InnoDB CHARSET=UTF8;
-- --------------------------------------------------------

--
-- 表的结构 `jd_plugins`
--

DROP TABLE IF EXISTS `jd_plugins`;
CREATE TABLE `jd_plugins` (
  `code` varchar(30) NOT NULL default '',
  `version` varchar(10) NOT NULL default '',
  `library` varchar(255) NOT NULL default '',
  `assign` tinyint(1) unsigned NOT NULL default '0',
  `install_date` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`code`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_region`
--

DROP TABLE IF EXISTS `jd_region`;
CREATE TABLE `jd_region` (
  `region_id` smallint(5) unsigned NOT NULL auto_increment,
  `parent_id` smallint(5) unsigned NOT NULL default '0',
  `region_name` varchar(120) NOT NULL default '',
  `region_type` tinyint(1) NOT NULL default '2',
  `agency_id` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`region_id`),
  KEY `parent_id` (`parent_id`),
  KEY `region_type` (`region_type`),
  KEY `agency_id` (`agency_id`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_reg_extend_info`
--

DROP TABLE IF EXISTS `jd_reg_extend_info`;
CREATE TABLE `jd_reg_extend_info` (
  `Id` int(10) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL,
  `reg_field_id` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_reg_fields`
--

DROP TABLE IF EXISTS `jd_reg_fields`;
CREATE TABLE `jd_reg_fields` (
  `id` tinyint(3) unsigned NOT NULL auto_increment,
  `reg_field_name` varchar(60) NOT NULL,
  `dis_order` tinyint unsigned NOT NULL default '100',
  `display` tinyint(1) unsigned NOT NULL default '1',
  `type` tinyint(1) unsigned NOT NULL default '0',
  `is_need` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB CHARSET=UTF8, AUTO_INCREMENT=100;

-- --------------------------------------------------------

--
-- 表的结构 `jd_searchengine`
--

DROP TABLE IF EXISTS `jd_searchengine`;
CREATE TABLE `jd_searchengine` (
  `date` date NOT NULL default '0000-00-00',
  `searchengine` varchar(20) NOT NULL default '',
  `count` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`date`,`searchengine`)
) ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_sessions`
--

DROP TABLE IF EXISTS `jd_sessions`;
CREATE TABLE `jd_sessions` (
  `sesskey` char(32) binary NOT NULL default '',
  `expiry` int(10) unsigned NOT NULL default '0',
  `userid` mediumint(8) unsigned NOT NULL default '0',
  `adminid` mediumint(8) unsigned NOT NULL default '0',
  `ip` char(15) NOT NULL default '',
  `user_name` varchar(60) NOT NULL,
  `user_rank` tinyint(3) NOT NULL,
  `discount` decimal(3,2) NOT NULL,
  `email` varchar(60) NOT NULL,
  `data` char(255) NOT NULL default '',
  PRIMARY KEY  (`sesskey`),
  KEY `expiry` (`expiry`)
) ENGINE=InnoDB CHARSET=UTF8;


-- --------------------------------------------------------

--
-- 表的结构 `jd_sessions_data`
--

DROP TABLE IF EXISTS `jd_sessions_data`;
CREATE TABLE `jd_sessions_data` (
  `sesskey` varchar( 32 ) binary NOT NULL default '',
  `expiry` int( 10 ) unsigned NOT NULL default '0',
  `data` longtext NOT NULL ,
  PRIMARY KEY ( `sesskey` ) ,
  KEY `expiry` ( `expiry` )
) ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_shipping`
--

DROP TABLE IF EXISTS `jd_shipping`;
CREATE TABLE `jd_shipping` (
  `shipping_id` tinyint(3) unsigned NOT NULL auto_increment,
  `shipping_code` varchar(20) NOT NULL default '',
  `shipping_name` varchar(120) NOT NULL default '',
  `shipping_desc` varchar(255) NOT NULL default '',
  `insure` VARCHAR( 10 ) NOT NULL DEFAULT '0',
  `support_cod` tinyint(1) unsigned NOT NULL default '0',
  `enabled` tinyint(1) unsigned NOT NULL default '0',
  `shipping_print` text NOT NULL,
  `print_bg` varchar(255) default NULL,
  `config_lable` text,
  `print_model` tinyint(1) default '0',
  `shipping_order` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`shipping_id`),
  KEY `shipping_code` (`shipping_code`,`enabled`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_shipping_area`
--

DROP TABLE IF EXISTS `jd_shipping_area`;
CREATE TABLE `jd_shipping_area` (
  `shipping_area_id` smallint(5) unsigned NOT NULL auto_increment,
  `shipping_area_name` varchar(150) NOT NULL default '',
  `shipping_id` tinyint(3) unsigned NOT NULL default '0',
  `configure` text NOT NULL,
  PRIMARY KEY  (`shipping_area_id`),
  KEY `shipping_id` (`shipping_id`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_shop_config`
--

DROP TABLE IF EXISTS `jd_shop_config`;
CREATE TABLE `jd_shop_config` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `parent_id` smallint(5) unsigned NOT NULL default '0',
  `code` varchar(30) NOT NULL default '',
  `type` varchar(10) NOT NULL default '',
  `store_range` varchar(255) NOT NULL default '',
  `store_dir` varchar(255) NOT NULL default '',
  `value` text NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL  default '1',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `parent_id` (`parent_id`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_snatch_log`
--

DROP TABLE IF EXISTS `jd_snatch_log`;
CREATE TABLE `jd_snatch_log` (
  `log_id` mediumint(8) unsigned NOT NULL auto_increment,
  `snatch_id` tinyint(3) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `bid_price` decimal(10,2) NOT NULL default '0.00',
  `bid_time` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`log_id`),
  KEY `snatch_id` (`snatch_id`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_stats`
--

DROP TABLE IF EXISTS `jd_stats`;
CREATE TABLE `jd_stats` (
  `access_time` int(10) unsigned NOT NULL default '0',
  `ip_address` varchar(15) NOT NULL default '',
  `visit_times` smallint(5) unsigned NOT NULL default '1',
  `browser` varchar(60) NOT NULL default '',
  `system` varchar(20) NOT NULL default '',
  `language` varchar(20) NOT NULL default '',
  `area` varchar(30) NOT NULL default '',
  `referer_domain` varchar(100) NOT NULL default '',
  `referer_path` varchar(200) NOT NULL default '',
  `access_url` varchar(255) NOT NULL default '',
  KEY `access_time` (`access_time`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_tag`
--

DROP TABLE IF EXISTS `jd_tag`;
CREATE TABLE `jd_tag` (
  `tag_id` mediumint(8) NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `tag_words` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`tag_id`),
  KEY `user_id` (`user_id`),
  KEY `goods_id` (`goods_id`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_template`
--

DROP TABLE IF EXISTS `jd_template`;
CREATE TABLE `jd_template` (
  `filename` varchar(30) NOT NULL default '',
  `region` varchar(40) NOT NULL default '',
  `library` varchar(40) NOT NULL default '',
  `sort_order` tinyint(1) unsigned NOT NULL default '0',
  `id` smallint(5) unsigned NOT NULL default '0',
  `number` tinyint(1) unsigned NOT NULL default '5',
  `type` tinyint(1) unsigned NOT NULL default '0',
  `theme` varchar(60) NOT NULL default '',
  `remarks` varchar(30) NOT NULL default '',
  KEY `filename` (`filename`,`region`),
  KEY `theme` (`theme`),
  KEY `remarks` (`remarks`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_user_address`
--

DROP TABLE IF EXISTS `jd_user_address`;
CREATE TABLE `jd_user_address` (
  `address_id` mediumint(8) unsigned NOT NULL auto_increment,
  `address_name` varchar(50) NOT NULL default '',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `consignee` varchar(60) NOT NULL default '',
  `email` varchar(60) NOT NULL default '',
  `country` smallint(5) NOT NULL default '0',
  `province` smallint(5) NOT NULL default '0',
  `city` smallint(5) NOT NULL default '0',
  `district` smallint(5) NOT NULL default '0',
  `address` varchar(120) NOT NULL default '',
  `zipcode` varchar(60) NOT NULL default '',
  `tel` varchar(60) NOT NULL default '',
  `mobile` varchar(60) NOT NULL default '',
  `sign_building` varchar(120) NOT NULL default '',
  `best_time` varchar(120) NOT NULL default '',
  PRIMARY KEY  (`address_id`),
  KEY `user_id` (`user_id`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_user_bonus`
--

DROP TABLE IF EXISTS `jd_user_bonus`;
CREATE TABLE `jd_user_bonus` (
  `bonus_id` mediumint(8) unsigned NOT NULL auto_increment,
  `bonus_type_id` tinyint(3) unsigned NOT NULL default '0',
  `bonus_sn` bigint(20) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `used_time` int(10) unsigned NOT NULL default '0',
  `order_id` mediumint(8) unsigned NOT NULL default '0',
  `emailed` tinyint unsigned NOT NULL default '0',
  PRIMARY KEY  (`bonus_id`),
  KEY `user_id` (`user_id`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- ---------------------------------------------------------
--
-- 表的结构 `jd_user_feed`
--

DROP TABLE IF EXISTS `jd_user_feed`;
CREATE TABLE IF NOT EXISTS `jd_user_feed` (
  `feed_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `value_id` mediumint(8) unsigned NOT NULL default '0',
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `feed_type` tinyint(1) unsigned NOT NULL default '0',
  `is_feed` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`feed_id`)
)  ENGINE=InnoDB CHARSET=UTF8;


-- --------------------------------------------------------

--
-- 表的结构 `jd_user_rank`
--

DROP TABLE IF EXISTS `jd_user_rank`;
CREATE TABLE `jd_user_rank` (
  `rank_id` tinyint(3) unsigned NOT NULL auto_increment,
  `rank_name` varchar(30) NOT NULL default '',
  `min_points` int unsigned NOT NULL default '0',
  `max_points` int unsigned NOT NULL default '0',
  `discount` tinyint(3) unsigned NOT NULL default '0',
  `show_price` tinyint(1) unsigned NOT NULL default '1',
  `special_rank` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`rank_id`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_users`
--

DROP TABLE IF EXISTS `jd_users`;
CREATE TABLE `jd_users` (
  `user_id` mediumint(8) unsigned NOT NULL auto_increment,
  `email` varchar(60) NOT NULL default '',
  `user_name` varchar(60) NOT NULL default '',
  `password` varchar(32) NOT NULL default '',
  `question` varchar(255) NOT NULL default '',
  `answer` varchar(255) NOT NULL default '',
  `sex` tinyint(1) unsigned NOT NULL default '0',
  `birthday` date NOT NULL default '0000-00-00',
  `user_money` decimal(10,2) NOT NULL default '0.00',
  `frozen_money` decimal(10,2) NOT NULL default '0.00',
  `pay_points` int unsigned NOT NULL default '0',
  `rank_points` int unsigned NOT NULL default '0',
  `address_id` mediumint(8) unsigned NOT NULL default '0',
  `reg_time` int(10) unsigned NOT NULL default '0',
  `last_login` INT( 11 ) UNSIGNED NOT NULL default '0',
  `last_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_ip` varchar(15) NOT NULL default '',
  `visit_count` smallint(5) unsigned NOT NULL default '0',
  `user_rank` tinyint(3) unsigned NOT NULL default '0',
  `is_special` tinyint(3) unsigned NOT NULL default '0',
  `ec_salt` VARCHAR( 10 )  NULL ,
  `salt` varchar(10) NOT NULL default '0',
  `parent_id` mediumint(9) NOT NULL default '0',
  `flag` TINYINT UNSIGNED NOT NULL DEFAULT '0',
  `alias` VARCHAR( 60 ) NOT NULL ,
  `msn` VARCHAR( 60 ) NOT NULL ,
  `qq` VARCHAR( 20 ) NOT NULL,
  `office_phone` VARCHAR( 20 ) NOT NULL,
  `home_phone` VARCHAR( 20 ) NOT NULL,
  `mobile_phone` VARCHAR( 20 ) NOT NULL,
  `is_validated` TINYINT UNSIGNED NOT NULL DEFAULT '0',
  `credit_line` DECIMAL( 10, 2 ) UNSIGNED NOT NULL,
  `passwd_question` VARCHAR( 50 ) NULL,
  `passwd_answer` VARCHAR( 255 ) NULL,
  PRIMARY KEY  (`user_id`),
  KEY `email` (`email`),
  KEY `parent_id` (`parent_id`),
  KEY `flag` (`flag`),
  UNIQUE (`user_name`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_vote`
--

DROP TABLE IF EXISTS `jd_vote`;
CREATE TABLE `jd_vote` (
  `vote_id` smallint unsigned NOT NULL auto_increment,
  `vote_name` varchar(250) NOT NULL default '',
  `start_time` int(11) unsigned NOT NULL default '0',
  `end_time` int(11) unsigned NOT NULL default '0',
  `can_multi` tinyint(1) unsigned NOT NULL default '0',
  `vote_count` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`vote_id`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_vote_log`
--

DROP TABLE IF EXISTS `jd_vote_log`;
CREATE TABLE `jd_vote_log` (
  `log_id` mediumint(8) unsigned NOT NULL auto_increment,
  `vote_id` smallint unsigned NOT NULL default '0',
  `ip_address` varchar(15) NOT NULL default '',
  `vote_time` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`log_id`),
  KEY `vote_id` (`vote_id`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_vote_option`
--

DROP TABLE IF EXISTS `jd_vote_option`;
CREATE TABLE `jd_vote_option` (
  `option_id` smallint(5) unsigned NOT NULL auto_increment,
  `vote_id` smallint unsigned NOT NULL default '0',
  `option_name` varchar(250) NOT NULL default '',
  `option_count` int(8) unsigned NOT NULL default '0',
  `option_order` tinyint(3) unsigned NOT NULL default '100',
  PRIMARY KEY  (`option_id`),
  KEY `vote_id` (`vote_id`)
)  ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------
--
-- 表的结构 `jd_pay_log`
--
DROP TABLE IF EXISTS `jd_pay_log`;
CREATE TABLE `jd_pay_log` (
  `log_id` int(10) unsigned NOT NULL auto_increment,
  `order_id` mediumint(8) unsigned NOT NULL default '0',
  `order_amount` decimal(10,2) unsigned NOT NULL,
  `order_type` tinyint(1) unsigned NOT NULL default '0',
  `is_paid` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`log_id`)
) ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------
--
-- 表的结构 `jd_user_account`
--
DROP TABLE IF EXISTS `jd_user_account`;
CREATE TABLE `jd_user_account` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `admin_user` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `add_time` int(10) NOT NULL default '0',
  `paid_time` int(10) NOT NULL default '0',
  `admin_note` varchar(255) NOT NULL,
  `user_note` varchar(255) NOT NULL,
  `process_type` tinyint(1) NOT NULL default '0',
  `payment` varchar(90) NOT NULL,
  `is_paid` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `user_id` (`user_id`),
  KEY `is_paid` (`is_paid`)
) ENGINE=InnoDB CHARSET=UTF8;

--
-- 表的结构 `jd_agency`
--
DROP TABLE IF EXISTS `jd_agency`;
CREATE TABLE `jd_agency` (
  `agency_id` smallint(5) unsigned NOT NULL auto_increment,
  `agency_name` varchar(255) NOT NULL,
  `agency_desc` text NOT NULL,
  PRIMARY KEY  (`agency_id`),
  KEY `agency_name` (`agency_name`)
) ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_goods_activity`
--

DROP TABLE IF EXISTS `jd_goods_activity`;
CREATE TABLE `jd_goods_activity` (
  `act_id` mediumint(8) unsigned NOT NULL auto_increment,
  `act_name` varchar(255) NOT NULL,
  `act_desc` text NOT NULL,
  `act_type` tinyint(3) unsigned NOT NULL,
  `goods_id` mediumint(8) unsigned NOT NULL,
  `product_id` mediumint(8) unsigned NOT NULL default '0',
  `goods_name` varchar(255) NOT NULL,
  `start_time` int(10) unsigned NOT NULL,
  `end_time` int(10) unsigned NOT NULL,
  `is_finished` tinyint(3) unsigned NOT NULL,
  `ext_info` text NOT NULL,
  PRIMARY KEY  (`act_id`),
  KEY `act_name` (`act_name`,`act_type`,`goods_id`)
) ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `account_log`
--

DROP TABLE IF EXISTS `jd_account_log`;
CREATE TABLE `jd_account_log` (
  `log_id` mediumint(8) unsigned NOT NULL auto_increment,
  `user_id` mediumint(8) unsigned NOT NULL,
  `user_money` decimal(10,2) NOT NULL,
  `frozen_money` decimal(10,2) NOT NULL,
  `rank_points` mediumint(9) NOT NULL,
  `pay_points` mediumint(9) NOT NULL,
  `change_time` int(10) unsigned NOT NULL,
  `change_desc` varchar(255) NOT NULL,
  `change_type` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY  (`log_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_topic`
--

DROP TABLE IF EXISTS `jd_topic`;
CREATE TABLE `jd_topic` (
  `topic_id` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '''''',
  `intro` text NOT NULL,
  `start_time` int(11) NOT NULL default '0',
  `end_time` int(10) NOT NULL default '0',
  `data` text NOT NULL,
  `template` varchar(255) NOT NULL default '''''',
  `css` text NOT NULL,
  `topic_img` varchar(255) default NULL,
  `title_pic` varchar(255) default NULL,
  `base_style` char(6) default NULL,
  `htmls` mediumtext,
  `keywords` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  KEY `topic_id` (`topic_id`)
) ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_auction_log`
--

DROP TABLE IF EXISTS `jd_auction_log`;
CREATE TABLE `jd_auction_log` (
  `log_id` mediumint(8) unsigned NOT NULL auto_increment,
  `act_id` mediumint(8) unsigned NOT NULL,
  `bid_user` mediumint(8) unsigned NOT NULL,
  `bid_price` decimal(10,2) unsigned NOT NULL,
  `bid_time` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`log_id`),
  KEY `act_id` (`act_id`)
) ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------


-- 增加分成信息纪录
DROP TABLE IF EXISTS `jd_affiliate_log`;
CREATE TABLE  `jd_affiliate_log` (
 `log_id` MEDIUMINT( 8 ) NOT NULL auto_increment,
 `order_id` MEDIUMINT( 8 ) NOT NULL ,
 `time` INT( 10 ) NOT NULL ,
 `user_id` MEDIUMINT( 8 ) NOT NULL,
 `user_name` varchar(60),
 `money` DECIMAL(10,2) NOT NULL DEFAULT '0',
 `point` INT(10) NOT NULL DEFAULT '0',
 `separate_type` TINYINT(1) NOT NULL DEFAULT '0',
PRIMARY KEY ( `log_id` )
) ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_favourable_activity`
--

DROP TABLE IF EXISTS `jd_favourable_activity`;
CREATE TABLE `jd_favourable_activity` (
  `act_id` smallint(5) unsigned NOT NULL auto_increment,
  `act_name` varchar(255) NOT NULL,
  `start_time` int(10) unsigned NOT NULL,
  `end_time` int(10) unsigned NOT NULL,
  `user_rank` varchar(255) NOT NULL,
  `act_range` tinyint(3) unsigned NOT NULL,
  `act_range_ext` varchar(255) NOT NULL,
  `min_amount` decimal(10,2) unsigned NOT NULL,
  `max_amount` decimal(10,2) unsigned NOT NULL,
  `act_type` tinyint(3) unsigned NOT NULL,
  `act_type_ext` decimal(10,2) unsigned NOT NULL,
  `gift` text NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '50',
  PRIMARY KEY  (`act_id`),
  KEY `act_name` (`act_name`)
) ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_virtual_card`
--
DROP TABLE IF EXISTS `jd_virtual_card`;
CREATE TABLE `jd_virtual_card` (
    `card_id` mediumint(8) NOT NULL auto_increment,
    `goods_id` mediumint(8) unsigned NOT NULL default '0',
    `card_sn` varchar(60) NOT NULL default '',
    `card_password` varchar(60) NOT NULL default '',
    `add_date` int(11) NOT NULL default '0',
    `end_date` int(11) NOT NULL default '0',
    `is_saled` tinyint(1) NOT NULL default '0',
    `order_sn` varchar(20) NOT NULL default '',
    `crc32` varchar(12) NOT NULL default '0',
    PRIMARY KEY  (`card_id`),
    KEY `goods_id` (`goods_id`),
    KEY `car_sn` (`card_sn`),
    KEY `is_saled` (`is_saled`)
    ) ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_wholesale`
--
DROP TABLE IF EXISTS `jd_wholesale`;
CREATE TABLE IF NOT EXISTS `jd_wholesale` (
  `act_id` mediumint(8) unsigned NOT NULL auto_increment,
  `goods_id` mediumint(8) unsigned NOT NULL,
  `goods_name` varchar(255) NOT NULL,
  `rank_ids` varchar(255) NOT NULL,
  `prices` text NOT NULL,
  `enabled` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY  (`act_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB CHARSET=UTF8;

-- --------------------------------------------------------

--
-- 表的结构 `jd_nav`
--
DROP TABLE IF EXISTS `jd_nav`;
CREATE TABLE `jd_nav` (
  `id` mediumint(8) NOT NULL auto_increment,
  `ctype` VARCHAR( 10 ) NULL,
  `cid` SMALLINT( 5 ) UNSIGNED NULL,
  `name` varchar(255) NOT NULL,
  `ifshow` tinyint(1) NOT NULL,
  `vieworder` tinyint(1) NOT NULL,
  `opennew` tinyint(1) NOT NULL,
  `url` varchar(255) NOT NULL,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `type` (`type`),
  KEY `ifshow` (`ifshow`)
) ENGINE=InnoDB CHARSET=UTF8;

-- 增加发送队列表
DROP TABLE IF EXISTS `jd_email_sendlist`;
CREATE TABLE  `jd_email_sendlist` (
 `id` MEDIUMINT( 8 ) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
 `email` VARCHAR( 100 ) NOT NULL ,
 `template_id` MEDIUMINT( 8 ) NOT NULL ,
 `email_content` TEXT NOT NULL ,
 `error` TINYINT( 1 ) NOT NULL DEFAULT  '0' ,
 `pri` TINYINT( 10 ) NOT NULL ,
 `last_send` INT( 10 ) NOT NULL
) ENGINE=InnoDB CHARSET=UTF8;

-- 增加电子杂志订阅表
DROP TABLE IF EXISTS `jd_email_list`;
CREATE TABLE `jd_email_list` (
  `id` mediumint(8) NOT NULL auto_increment,
  `email` varchar(60) NOT NULL,
  `stat` tinyint(1) NOT NULL default '0',
  `hash` varchar(10) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB CHARSET=UTF8;

-- 增加自动处理的表
DROP TABLE IF EXISTS `jd_auto_manage`;
CREATE TABLE `jd_auto_manage` (
  `item_id` mediumint(8) NOT NULL,
  `type` varchar(10) NOT NULL,
  `starttime` int(10) NOT NULL,
  `endtime` int(10) NOT NULL,
  PRIMARY KEY  (`item_id`,`type`)
) ENGINE=InnoDB CHARSET=UTF8;

-- 增加分类首页推荐表
DROP TABLE IF EXISTS `jd_cat_recommend`;
CREATE TABLE `jd_cat_recommend` (
  `cat_id` smallint(5) NOT NULL,
  `recommend_type` tinyint(1) NOT NULL,
  PRIMARY KEY  (`cat_id`,`recommend_type`)
) ENGINE=InnoDB CHARSET=UTF8;

-- 增加商品批量购买优惠价格表
DROP TABLE IF EXISTS `jd_volume_price`;
CREATE TABLE IF NOT EXISTS `jd_volume_price` (
  `price_type` tinyint(1) unsigned NOT NULL,
  `goods_id` mediumint(8) unsigned NOT NULL,
  `volume_number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `volume_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`price_type`,`goods_id`,`volume_number`)
) ENGINE=InnoDB CHARSET=UTF8;

-- 增加超值礼包商品表
DROP TABLE IF EXISTS `jd_package_goods`;
CREATE TABLE `jd_package_goods` (
  `package_id` mediumint( 8 ) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint( 8 ) unsigned NOT NULL DEFAULT '0',
  `product_id` mediumint(8) unsigned NOT NULL default '0',
  `goods_number` smallint( 5 ) unsigned NOT NULL DEFAULT '1',
  `admin_id` tinyint( 3 ) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY  (`package_id`,`goods_id`,`admin_id`,`product_id`)
) ENGINE=InnoDB CHARSET=UTF8;

-- 增加积分商城商品表
DROP TABLE IF EXISTS `jd_exchange_goods`;
CREATE TABLE IF NOT EXISTS `jd_exchange_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `exchange_integral` int(10) unsigned NOT NULL DEFAULT '0',
  `is_exchange` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB CHARSET=UTF8;

-- 发货单商品表 `jd_delivery_goods`
DROP TABLE IF EXISTS `jd_delivery_goods`;
CREATE TABLE `jd_delivery_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL auto_increment,
  `delivery_id` mediumint(8) unsigned NOT NULL default '0',
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `product_id` mediumint(8) unsigned default '0',
  `product_sn` varchar(60) default NULL,
  `goods_name` varchar(120) default NULL,
  `brand_name` varchar(60) default NULL,
  `goods_sn` varchar(60) default NULL,
  `is_real` tinyint(1) unsigned default '0',
  `extension_code` varchar(30) default NULL,
  `parent_id` mediumint(8) unsigned default '0',
  `send_number` smallint(5) unsigned default '0',
  `goods_attr` text,
  PRIMARY KEY  (`rec_id`),
  KEY `delivery_id` (`delivery_id`,`goods_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB CHARSET=UTF8;

-- 发货单表 `jd_delivery_order`
DROP TABLE IF EXISTS `jd_delivery_order`;
CREATE TABLE `jd_delivery_order` (
  `delivery_id` mediumint(8) unsigned NOT NULL auto_increment,
  `delivery_sn` varchar(20) NOT NULL,
  `order_sn` varchar(20) NOT NULL,
  `order_id` mediumint(8) unsigned NOT NULL default '0',
  `invoice_no` varchar(50) default NULL,
  `add_time` int(10) unsigned default '0',
  `shipping_id` tinyint(3) unsigned default '0',
  `shipping_name` varchar(120) default NULL,
  `user_id` mediumint(8) unsigned default '0',
  `action_user` varchar(30) default NULL,
  `consignee` varchar(60) default NULL,
  `address` varchar(250) default NULL,
  `country` smallint(5) unsigned default '0',
  `province` smallint(5) unsigned default '0',
  `city` smallint(5) unsigned default '0',
  `district` smallint(5) unsigned default '0',
  `sign_building` varchar(120) default NULL,
  `email` varchar(60) default NULL,
  `zipcode` varchar(60) default NULL,
  `tel` varchar(60) default NULL,
  `mobile` varchar(60) default NULL,
  `best_time` varchar(120) default NULL,
  `postscript` varchar(255) default NULL,
  `how_oos` varchar(120) default NULL,
  `insure_fee` decimal(10,2) unsigned default '0.00',
  `shipping_fee` decimal(10,2) unsigned default '0.00',
  `update_time` int(10) unsigned default '0',
  `suppliers_id` smallint(5) default '0',
  `status` tinyint(1) unsigned NOT NULL default '0',
  `agency_id` smallint(5) unsigned default '0',
  PRIMARY KEY  (`delivery_id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB CHARSET=UTF8;

-- 退货单商品表 `jd_back_goods`
DROP TABLE IF EXISTS `jd_back_goods`;
CREATE TABLE `jd_back_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL auto_increment,
  `back_id` mediumint(8) unsigned default '0',
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `product_id` mediumint(8) unsigned NOT NULL default '0',
  `product_sn` varchar(60) default NULL,
  `goods_name` varchar(120) default NULL,
  `brand_name` varchar(60) default NULL,
  `goods_sn` varchar(60) default NULL,
  `is_real` tinyint(1) unsigned default '0',
  `send_number` smallint(5) unsigned default '0',
  `goods_attr` text,
  PRIMARY KEY  (`rec_id`),
  KEY `back_id` (`back_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB CHARSET=UTF8;

-- 退货单表 `jd_back_order`
DROP TABLE IF EXISTS `jd_back_order`;
CREATE TABLE `jd_back_order` (
  `back_id` mediumint(8) unsigned NOT NULL auto_increment,
  `delivery_sn` varchar(20) NOT NULL,
  `order_sn` varchar(20) NOT NULL,
  `order_id` mediumint(8) unsigned NOT NULL default '0',
  `invoice_no` varchar(50) default NULL,
  `add_time` int(10) unsigned default '0',
  `shipping_id` tinyint(3) unsigned default '0',
  `shipping_name` varchar(120) default NULL,
  `user_id` mediumint(8) unsigned default '0',
  `action_user` varchar(30) default NULL,
  `consignee` varchar(60) default NULL,
  `address` varchar(250) default NULL,
  `country` smallint(5) unsigned default '0',
  `province` smallint(5) unsigned default '0',
  `city` smallint(5) unsigned default '0',
  `district` smallint(5) unsigned default '0',
  `sign_building` varchar(120) default NULL,
  `email` varchar(60) default NULL,
  `zipcode` varchar(60) default NULL,
  `tel` varchar(60) default NULL,
  `mobile` varchar(60) default NULL,
  `best_time` varchar(120) default NULL,
  `postscript` varchar(255) default NULL,
  `how_oos` varchar(120) default NULL,
  `insure_fee` decimal(10,2) unsigned default '0.00',
  `shipping_fee` decimal(10,2) unsigned default '0.00',
  `update_time` int(10) unsigned default '0',
  `suppliers_id` smallint(5) default '0',
  `status` tinyint(1) unsigned NOT NULL default '0',
  `return_time` int(10) unsigned default '0',
  `agency_id` smallint(5) unsigned default '0',
  PRIMARY KEY  (`back_id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB CHARSET=UTF8;

-- 供货商 `jd_suppliers`
DROP TABLE IF EXISTS `jd_suppliers`;
CREATE TABLE `jd_suppliers` (
  `suppliers_id` smallint(5) unsigned NOT NULL auto_increment,
  `suppliers_name` varchar(255) default NULL,
  `suppliers_desc` mediumtext,
  `is_check` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`suppliers_id`)
) ENGINE=InnoDB CHARSET=UTF8;

-- 首页主广告用户自定义表 `jd_ad_custom`
DROP TABLE IF EXISTS `jd_ad_custom`;
CREATE TABLE `jd_ad_custom` (
`ad_id` MEDIUMINT( 8 ) UNSIGNED NOT NULL auto_increment,
`ad_type` TINYINT( 1 ) UNSIGNED DEFAULT '1' NOT NULL ,
`ad_name` VARCHAR( 60 ) ,
`add_time` INT( 10 ) UNSIGNED DEFAULT '0' NOT NULL ,
`content` mediumtext,
`url` varchar(255) ,
`ad_status` TINYINT( 0 ) UNSIGNED DEFAULT '0' NOT NULL ,
PRIMARY KEY ( `ad_id` )
)ENGINE=InnoDB CHARSET=UTF8;

-- 角色管理

DROP TABLE IF EXISTS `jd_role`;
CREATE TABLE `jd_role` (
  `role_id` smallint(5) unsigned NOT NULL auto_increment,
  `role_name` varchar(60) NOT NULL default '',
  `action_list` text NOT NULL,
  `role_describe` text,
  PRIMARY KEY  (`role_id`),
  KEY `user_name` (`role_name`)
) ENGINE=InnoDB CHARSET=UTF8;

-- 货品表

DROP TABLE IF EXISTS `jd_products`;
CREATE TABLE `jd_products` (
  `product_id` mediumint(8) unsigned NOT NULL auto_increment,
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `goods_attr` varchar(50) default NULL,
  `product_sn` varchar(60) default NULL,
  `product_number` smallint(5) unsigned default '0',
  PRIMARY KEY  (`product_id`)
) ENGINE=InnoDB CHARSET=UTF8;