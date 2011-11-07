
-- *** STRUCTURE: `tbl_fields_author` ***
DROP TABLE IF EXISTS `tbl_fields_author`;
CREATE TABLE `tbl_fields_author` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_author_change` enum('yes','no') NOT NULL,
  `allow_multiple_selection` enum('yes','no') NOT NULL DEFAULT 'no',
  `default_to_current_user` enum('yes','no') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_author` ***
INSERT INTO `tbl_fields_author` (`id`, `field_id`, `allow_author_change`, `allow_multiple_selection`, `default_to_current_user`) VALUES (12, 112, 'yes', 'no', 'no');

-- *** STRUCTURE: `tbl_fields_checkbox` ***
DROP TABLE IF EXISTS `tbl_fields_checkbox`;
CREATE TABLE `tbl_fields_checkbox` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `default_state` enum('on','off') NOT NULL DEFAULT 'on',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=404 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_checkbox` ***
INSERT INTO `tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (363, 9, 'off', 'Send me email when there is important news.');
INSERT INTO `tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (264, 15, 'off', 'Pin discussion');
INSERT INTO `tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (265, 16, 'off', 'Close this discussion');
INSERT INTO `tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (401, 56, 'off', 'Publish this article');
INSERT INTO `tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (403, 70, 'off', 'Promote to Home Page');
INSERT INTO `tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (25, 73, 'on', 'Subscribe to Newsletter');
INSERT INTO `tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (369, 86, 'off', NULL);
INSERT INTO `tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (371, 87, 'off', NULL);
INSERT INTO `tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (261, 91, 'on', NULL);
INSERT INTO `tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (377, 92, 'off', NULL);
INSERT INTO `tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (375, 100, 'off', NULL);
INSERT INTO `tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (373, 102, 'off', NULL);
INSERT INTO `tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (273, 106, 'on', NULL);
INSERT INTO `tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (285, 120, 'off', 'Publish this article');
INSERT INTO `tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (275, 137, 'on', NULL);
INSERT INTO `tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (279, 165, 'off', NULL);
INSERT INTO `tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (283, 162, 'off', NULL);
INSERT INTO `tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (379, 175, 'off', 'Publish this job listing');

-- *** STRUCTURE: `tbl_fields_date` ***
DROP TABLE IF EXISTS `tbl_fields_date`;
CREATE TABLE `tbl_fields_date` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `pre_populate` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=228 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_date` ***
INSERT INTO `tbl_fields_date` (`id`, `field_id`, `pre_populate`) VALUES (183, 12, 'yes');
INSERT INTO `tbl_fields_date` (`id`, `field_id`, `pre_populate`) VALUES (184, 14, 'yes');
INSERT INTO `tbl_fields_date` (`id`, `field_id`, `pre_populate`) VALUES (185, 19, 'yes');
INSERT INTO `tbl_fields_date` (`id`, `field_id`, `pre_populate`) VALUES (181, 33, 'no');
INSERT INTO `tbl_fields_date` (`id`, `field_id`, `pre_populate`) VALUES (105, 45, 'no');
INSERT INTO `tbl_fields_date` (`id`, `field_id`, `pre_populate`) VALUES (227, 57, 'yes');
INSERT INTO `tbl_fields_date` (`id`, `field_id`, `pre_populate`) VALUES (43, 66, 'yes');
INSERT INTO `tbl_fields_date` (`id`, `field_id`, `pre_populate`) VALUES (44, 72, 'yes');
INSERT INTO `tbl_fields_date` (`id`, `field_id`, `pre_populate`) VALUES (213, 85, 'yes');
INSERT INTO `tbl_fields_date` (`id`, `field_id`, `pre_populate`) VALUES (193, 117, 'yes');
INSERT INTO `tbl_fields_date` (`id`, `field_id`, `pre_populate`) VALUES (189, 124, 'yes');
INSERT INTO `tbl_fields_date` (`id`, `field_id`, `pre_populate`) VALUES (190, 135, 'yes');
INSERT INTO `tbl_fields_date` (`id`, `field_id`, `pre_populate`) VALUES (191, 159, 'yes');
INSERT INTO `tbl_fields_date` (`id`, `field_id`, `pre_populate`) VALUES (195, 163, 'no');
INSERT INTO `tbl_fields_date` (`id`, `field_id`, `pre_populate`) VALUES (215, 173, 'yes');

-- *** STRUCTURE: `tbl_fields_entry_url` ***
DROP TABLE IF EXISTS `tbl_fields_entry_url`;
CREATE TABLE `tbl_fields_entry_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `anchor_label` varchar(255) DEFAULT NULL,
  `expression` varchar(255) DEFAULT NULL,
  `new_window` enum('yes','no') DEFAULT 'no',
  `hide` enum('yes','no') DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_entry_url` ***
INSERT INTO `tbl_fields_entry_url` (`id`, `field_id`, `anchor_label`, `expression`, `new_window`, `hide`) VALUES (13, 167, 'Preview Draft: Save changes then click this link to go to the Drafts page (if not already published)', '/blog/drafts/{entry/title/@handle}/', 'yes', 'no');

-- *** STRUCTURE: `tbl_fields_input` ***
DROP TABLE IF EXISTS `tbl_fields_input`;
CREATE TABLE `tbl_fields_input` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=548 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_input` ***
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (515, 1, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (517, 3, '/^[^\\s:\\/?#]+:(?:\\/{2,3})?[^\\s.\\/?#]+(?:\\.[^\\s.\\/?#]+)*(?:\\/[^\\s?#]*\\??[^\\s?#]*(#[^\\s#]*)?)?$/');
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (519, 6, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (521, 7, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (447, 10, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (439, 23, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (440, 24, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (441, 25, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (445, 27, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (442, 28, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (443, 29, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (444, 30, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (71, 34, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (70, 36, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (305, 38, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (307, 40, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (154, 46, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (113, 51, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (545, 54, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (121, 62, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (143, 63, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (144, 64, '/^\\w(?:\\.?[\\w%+-]+)*@\\w(?:[\\w-]*\\.)+?[a-z]{2,}$/i');
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (145, 65, '/^[^\\s:\\/?#]+:(?:\\/{2,3})?[^\\s.\\/?#]+(?:\\.[^\\s.\\/?#]+)*(?:\\/[^\\s?#]*\\??[^\\s?#]*(#[^\\s#]*)?)?$/');
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (147, 71, '/^\\w(?:\\.?[\\w%+-]+)*@\\w(?:[\\w-]*\\.)+?[a-z]{2,}$/i');
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (461, 74, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (463, 75, '/^\\w(?:\\.?[\\w%+-]+)*@\\w(?:[\\w-]*\\.)+?[a-z]{2,}$/i');
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (465, 76, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (525, 78, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (527, 80, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (363, 89, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (198, 96, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (453, 103, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (454, 105, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (475, 114, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (459, 125, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (460, 127, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (529, 169, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (547, 177, NULL);

-- *** STRUCTURE: `tbl_fields_memberactivation` ***
DROP TABLE IF EXISTS `tbl_fields_memberactivation`;
CREATE TABLE `tbl_fields_memberactivation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `code_expiry` varchar(50) NOT NULL,
  `activation_role_id` int(11) unsigned NOT NULL,
  `auto_login` enum('yes','no') DEFAULT 'yes',
  `deny_login` enum('yes','no') DEFAULT 'yes',
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_memberactivation` ***
INSERT INTO `tbl_fields_memberactivation` (`id`, `field_id`, `code_expiry`, `activation_role_id`, `auto_login`, `deny_login`) VALUES (11, 152, '1 hour', 1, 'yes', 'yes');

-- *** STRUCTURE: `tbl_fields_memberemail` ***
DROP TABLE IF EXISTS `tbl_fields_memberemail`;
CREATE TABLE `tbl_fields_memberemail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_memberemail` ***
INSERT INTO `tbl_fields_memberemail` (`id`, `field_id`) VALUES (11, 149);

-- *** STRUCTURE: `tbl_fields_memberpassword` ***
DROP TABLE IF EXISTS `tbl_fields_memberpassword`;
CREATE TABLE `tbl_fields_memberpassword` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `length` tinyint(2) NOT NULL,
  `strength` enum('weak','good','strong') NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `code_expiry` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_memberpassword` ***
INSERT INTO `tbl_fields_memberpassword` (`id`, `field_id`, `length`, `strength`, `salt`, `code_expiry`) VALUES (11, 150, 6, 'good', '5Ms1E8OcpWUgC6g1', '1 hour');

-- *** STRUCTURE: `tbl_fields_memberrole` ***
DROP TABLE IF EXISTS `tbl_fields_memberrole`;
CREATE TABLE `tbl_fields_memberrole` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `default_role` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_memberrole` ***
INSERT INTO `tbl_fields_memberrole` (`id`, `field_id`, `default_role`) VALUES (11, 151, 1);

-- *** STRUCTURE: `tbl_fields_membertimezone` ***
DROP TABLE IF EXISTS `tbl_fields_membertimezone`;
CREATE TABLE `tbl_fields_membertimezone` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `available_zones` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_membertimezone` ***
INSERT INTO `tbl_fields_membertimezone` (`id`, `field_id`, `available_zones`) VALUES (11, 153, 'AMERICA');

-- *** STRUCTURE: `tbl_fields_memberusername` ***
DROP TABLE IF EXISTS `tbl_fields_memberusername`;
CREATE TABLE `tbl_fields_memberusername` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_memberusername` ***
INSERT INTO `tbl_fields_memberusername` (`id`, `field_id`, `validator`) VALUES (11, 148, NULL);

-- *** STRUCTURE: `tbl_fields_metakeys` ***
DROP TABLE IF EXISTS `tbl_fields_metakeys`;
CREATE TABLE `tbl_fields_metakeys` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) DEFAULT NULL,
  `default_keys` text,
  `delete_empty_keys` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_metakeys` ***

-- *** STRUCTURE: `tbl_fields_number` ***
DROP TABLE IF EXISTS `tbl_fields_number`;
CREATE TABLE `tbl_fields_number` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_number` ***

-- *** STRUCTURE: `tbl_fields_order_entries` ***
DROP TABLE IF EXISTS `tbl_fields_order_entries`;
CREATE TABLE `tbl_fields_order_entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `force_sort` enum('yes','no') DEFAULT 'no',
  `hide` enum('yes','no') DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_order_entries` ***
INSERT INTO `tbl_fields_order_entries` (`id`, `field_id`, `force_sort`, `hide`) VALUES (19, 107, NULL, 'no');
INSERT INTO `tbl_fields_order_entries` (`id`, `field_id`, `force_sort`, `hide`) VALUES (18, 143, NULL, 'yes');

-- *** STRUCTURE: `tbl_fields_select` ***
DROP TABLE IF EXISTS `tbl_fields_select`;
CREATE TABLE `tbl_fields_select` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') NOT NULL DEFAULT 'no',
  `static_options` text,
  `dynamic_options` int(11) unsigned DEFAULT NULL,
  `show_association` enum('yes','no') NOT NULL DEFAULT 'yes',
  `sort_options` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_select` ***
INSERT INTO `tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `static_options`, `dynamic_options`, `show_association`, `sort_options`) VALUES (3, 53, 'no', 'Strategy, Design, Technology', NULL, 'yes', 'no');

-- *** STRUCTURE: `tbl_fields_selectbox_link` ***
DROP TABLE IF EXISTS `tbl_fields_selectbox_link`;
CREATE TABLE `tbl_fields_selectbox_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') NOT NULL DEFAULT 'no',
  `related_field_id` varchar(255) NOT NULL,
  `limit` int(4) unsigned NOT NULL DEFAULT '20',
  `show_association` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=432 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_selectbox_link` ***
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `related_field_id`, `limit`, `show_association`) VALUES (341, 18, 'no', 10, 20, 'yes');
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `related_field_id`, `limit`, `show_association`) VALUES (217, 41, 'yes', 34, 20, 'yes');
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `related_field_id`, `limit`, `show_association`) VALUES (219, 42, 'yes', 36, 20, 'yes');
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `related_field_id`, `limit`, `show_association`) VALUES (431, 58, 'yes', 62, 20, 'yes');
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `related_field_id`, `limit`, `show_association`) VALUES (429, 60, 'no', 1, 50, 'no');
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `related_field_id`, `limit`, `show_association`) VALUES (96, 67, 'no', 54, 20, 'yes');
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `related_field_id`, `limit`, `show_association`) VALUES (405, 83, 'no', 1, 100, 'no');
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `related_field_id`, `limit`, `show_association`) VALUES (116, 98, 'no', 96, 20, 'yes');
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `related_field_id`, `limit`, `show_association`) VALUES (407, 99, 'no', 96, 20, 'yes');
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `related_field_id`, `limit`, `show_association`) VALUES (350, 108, 'no', 1, 100, 'no');
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `related_field_id`, `limit`, `show_association`) VALUES (351, 109, 'no', 103, 50, 'yes');
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `related_field_id`, `limit`, `show_association`) VALUES (352, 110, 'no', 1, 100, 'no');
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `related_field_id`, `limit`, `show_association`) VALUES (367, 116, 'no', 1, 100, 'no');
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `related_field_id`, `limit`, `show_association`) VALUES (369, 118, 'yes', 96, 50, 'yes');
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `related_field_id`, `limit`, `show_association`) VALUES (348, 122, 'no', 1, 100, 'no');
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `related_field_id`, `limit`, `show_association`) VALUES (349, 123, 'no', 114, 100, 'yes');
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `related_field_id`, `limit`, `show_association`) VALUES (339, 154, 'no', 148, 100, 'no');
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `related_field_id`, `limit`, `show_association`) VALUES (340, 155, 'no', 148, 100, 'no');
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `related_field_id`, `limit`, `show_association`) VALUES (342, 157, 'no', 148, 100, 'no');
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `related_field_id`, `limit`, `show_association`) VALUES (336, 22, 'no', 1, 100, 'no');
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `related_field_id`, `limit`, `show_association`) VALUES (353, 158, 'no', 148, 100, 'no');
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `related_field_id`, `limit`, `show_association`) VALUES (365, 161, 'no', 1, 100, 'no');
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `related_field_id`, `limit`, `show_association`) VALUES (357, 163, 'no', 1, 20, 'no');
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `related_field_id`, `limit`, `show_association`) VALUES (363, 160, 'no', 10, 20, 'no');

-- *** STRUCTURE: `tbl_fields_stage` ***
DROP TABLE IF EXISTS `tbl_fields_stage`;
CREATE TABLE `tbl_fields_stage` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL DEFAULT '0',
  `constructable` smallint(1) DEFAULT '0',
  `destructable` smallint(1) DEFAULT '0',
  `draggable` smallint(1) DEFAULT '0',
  `droppable` smallint(1) DEFAULT '0',
  `searchable` smallint(1) DEFAULT '0',
  `context` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_stage` ***
INSERT INTO `tbl_fields_stage` (`id`, `field_id`, `constructable`, `destructable`, `draggable`, `droppable`, `searchable`, `context`) VALUES (73, 79, 1, 1, 1, 1, 1, 'subsectionmanager');
INSERT INTO `tbl_fields_stage` (`id`, `field_id`, `constructable`, `destructable`, `draggable`, `droppable`, `searchable`, `context`) VALUES (37, 141, 1, 1, 1, 0, 1, 'subsectionmanager');
INSERT INTO `tbl_fields_stage` (`id`, `field_id`, `constructable`, `destructable`, `draggable`, `droppable`, `searchable`, `context`) VALUES (85, 145, 1, 1, 1, 1, 1, 'subsectionmanager');

-- *** STRUCTURE: `tbl_fields_stage_sorting` ***
DROP TABLE IF EXISTS `tbl_fields_stage_sorting`;
CREATE TABLE `tbl_fields_stage_sorting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `order` text,
  `context` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=864 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_stage_sorting` ***
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (1, 249, 79, 0, 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (2, 250, 79, 0, 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (3, 255, 79, 256, 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (4, 257, 79, 0, 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (91, 270, 79, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (6, 341, 79, 0, 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (7, 303, 79, 0, 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (8, 340, 79, 0, 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (9, 431, 79, 0, 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (10, 495, 141, '489,491,493', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (11, 487, 141, '483,485', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (12, 481, 141, '477,479', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (13, 475, 141, '471,473', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (14, 467, 141, '465,469', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (15, 463, 141, 461, 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (16, 459, 141, '197,198', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (17, 186, 141, '188,189', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (18, 185, 141, 227, 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (19, 184, 141, '203,204', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (20, 183, 141, '193,194', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (21, 182, 141, '202,201', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (22, 181, 141, '209,210', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (23, 180, 141, '230,231', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (24, 179, 141, '223,224', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (25, 178, 141, '215,216', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (26, 177, 141, '207,208', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (27, 176, 141, '232,233', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (28, 175, 141, '213,214', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (29, 174, 141, '205,206', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (30, 173, 141, '225,226', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (31, 172, 141, 222, 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (32, 171, 141, '220,221', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (33, 170, 141, '211,212', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (34, 169, 141, '218,219', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (35, 168, 141, 217, 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (36, 167, 141, '195,196', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (37, 165, 141, '190,192,191', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (38, 164, 141, '228,229', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (39, 96, 141, '105,106', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (40, 95, 141, '97,98,99', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (41, 94, 141, '102,103,104', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (42, 93, 141, '100,101', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (43, 92, 141, '89,91,90', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (44, 187, 141, '199,0,200,0', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (45, 501, 141, '497,499', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (46, 521, 141, '517,519', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (573, 529, 141, '523,525,527', NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (48, 675, 141, '677,679,0', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (49, 507, 141, 0, 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (50, 513, 141, 0, 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (267, 537, 141, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (52, 567, 145, '695,0', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (53, 144, 145, 697, 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (54, 139, 145, 699, 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (55, 150, 145, '703,701,705', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (56, 557, 145, '707,709', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (57, 579, 145, 711, 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (58, 601, 145, 713, 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (59, 595, 145, 0, 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (60, 607, 145, 0, 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (61, 621, 145, 0, 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (62, 625, 145, 0, 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (63, 627, 145, 0, 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (64, 629, 145, 715, 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (65, 631, 145, 0, 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (66, 635, 145, 717, 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (67, 637, 145, 0, 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (68, 639, 145, 0, 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (69, 643, 145, 719, 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (70, 647, 145, 721, 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (71, 651, 145, 0, 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (72, 657, 145, '723,725,727,729,731', 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (73, 655, 145, 733, 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (74, 661, 145, 735, 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (75, 669, 145, 737, 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (76, 551, 145, 739, 'subsectionmanager');
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (135, 744, 141, '742,743', NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (81, 747, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (131, 779, 79, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (95, 545, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (101, 665, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (123, 829, 79, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (129, 841, 79, 839, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (145, 887, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (147, 893, 79, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (179, 949, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (199, 973, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (223, 983, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (209, 1005, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (225, 1033, 79, 699, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (231, 1053, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (237, 1057, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (245, 1081, 141, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (351, 1085, 141, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (317, 1111, 141, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (249, 1101, 141, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (251, 1095, 141, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (457, 1137, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (271, 1151, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (301, 1157, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (303, 1159, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (315, 1179, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (325, 1187, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (327, 1161, 79, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (333, 1215, 141, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (349, 1233, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (353, 1363, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (375, 1461, 145, 1463, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (393, 1495, 145, '1493,1497,1499', NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (395, 1531, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (399, 1557, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (407, 1593, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (421, 1655, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (425, 1667, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (435, 1701, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (439, 1707, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (453, 1711, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (501, 1715, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (571, 1735, 141, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (489, 1763, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (487, 1709, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (557, 1803, 141, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (507, 1837, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (511, 1845, 141, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (521, 1849, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (531, 1851, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (535, 1905, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (807, 1917, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (803, 1927, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (583, 1935, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (569, 1943, 141, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (575, 1869, 141, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (579, 1945, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (801, 1951, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (799, 1953, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (797, 1955, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (795, 1957, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (643, 1961, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (793, 1963, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (641, 1981, 141, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (791, 1987, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (805, 1925, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (789, 1995, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (787, 1999, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (749, 2005, 141, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (785, 2009, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (851, 2019, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (775, 2021, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (821, 2025, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (833, 2027, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (839, 2031, 145, 0, NULL);
INSERT INTO `tbl_fields_stage_sorting` (`id`, `entry_id`, `field_id`, `order`, `context`) VALUES (863, 2073, 145, 0, NULL);

-- *** STRUCTURE: `tbl_fields_subsectionmanager` ***
DROP TABLE IF EXISTS `tbl_fields_subsectionmanager`;
CREATE TABLE `tbl_fields_subsectionmanager` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `subsection_id` varchar(255) NOT NULL,
  `filter_tags` text,
  `caption` text,
  `included_fields` text,
  `allow_multiple` tinyint(1) DEFAULT '0',
  `show_preview` tinyint(1) DEFAULT '0',
  `droptext` text,
  `lock` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_subsectionmanager` ***
INSERT INTO `tbl_fields_subsectionmanager` (`id`, `field_id`, `subsection_id`, `filter_tags`, `caption`, `included_fields`, `allow_multiple`, `show_preview`, `droptext`, `lock`) VALUES (73, 79, 16, NULL, '{$title}', '89,95', 0, 1, NULL, 0);
INSERT INTO `tbl_fields_subsectionmanager` (`id`, `field_id`, `subsection_id`, `filter_tags`, `caption`, `included_fields`, `allow_multiple`, `show_preview`, `droptext`, `lock`) VALUES (37, 141, 8, NULL, '{$title}', '46,47,48,49', 1, 1, NULL, 0);
INSERT INTO `tbl_fields_subsectionmanager` (`id`, `field_id`, `subsection_id`, `filter_tags`, `caption`, `included_fields`, `allow_multiple`, `show_preview`, `droptext`, `lock`) VALUES (85, 145, 16, NULL, '{$title}', '89,95', 1, 1, NULL, 0);

-- *** STRUCTURE: `tbl_fields_subsectionmanager_sorting` ***
DROP TABLE IF EXISTS `tbl_fields_subsectionmanager_sorting`;
CREATE TABLE `tbl_fields_subsectionmanager_sorting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `order` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=351 DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_fields_subsectionmanager_sorting` ***
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (86, 249, 79, 0);
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (87, 250, 79, 0);
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (96, 255, 79, 256);
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (97, 257, 79, 0);
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (350, 270, 79, 0);
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (92, 341, 79, 0);
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (88, 303, 79, 0);
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (98, 340, 79, 0);
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (111, 431, 79, 0);
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (219, 495, 141, '489,491,493');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (235, 487, 141, '483,485');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (215, 481, 141, '477,479');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (213, 475, 141, '471,473');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (211, 467, 141, '465,469');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (237, 463, 141, 461);
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (207, 459, 141, '197,198');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (131, 186, 141, '188,189');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (239, 185, 141, 227);
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (135, 184, 141, '203,204');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (137, 183, 141, '193,194');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (139, 182, 141, '202,201');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (141, 181, 141, '209,210');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (249, 180, 141, '230,231');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (243, 179, 141, '223,224');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (147, 178, 141, '215,216');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (247, 177, 141, '207,208');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (151, 176, 141, '232,233');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (245, 175, 141, '213,214');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (155, 174, 141, '205,206');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (157, 173, 141, '225,226');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (159, 172, 141, 222);
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (161, 171, 141, '220,221');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (163, 170, 141, '211,212');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (165, 169, 141, '218,219');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (167, 168, 141, 217);
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (169, 167, 141, '195,196');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (171, 165, 141, '190,192,191');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (173, 164, 141, '228,229');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (175, 96, 141, '105,106');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (185, 95, 141, '97,98,99');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (179, 94, 141, '102,103,104');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (181, 93, 141, '100,101');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (183, 92, 141, '89,91,90');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (199, 187, 141, '199,0,200,0');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (221, 501, 141, '497,499');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (229, 521, 141, '517,519');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (231, 529, 141, '523,525,527');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (223, 675, 141, '677,679,0');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (225, 507, 141, 0);
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (241, 513, 141, 0);
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (233, 537, 141, 0);
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (251, 567, 145, '695,0');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (253, 144, 145, 697);
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (255, 139, 145, 699);
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (257, 150, 145, '703,701,705');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (263, 557, 145, '707,709');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (275, 579, 145, 711);
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (277, 601, 145, 713);
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (279, 595, 145, 0);
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (291, 607, 145, 0);
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (293, 621, 145, 0);
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (295, 625, 145, 0);
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (297, 627, 145, 0);
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (301, 629, 145, 715);
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (307, 631, 145, 0);
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (309, 635, 145, 717);
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (317, 637, 145, 0);
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (321, 639, 145, 0);
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (327, 643, 145, 719);
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (325, 647, 145, 721);
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (329, 651, 145, 0);
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (339, 657, 145, '723,725,727,729,731');
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (341, 655, 145, 733);
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (343, 661, 145, 735);
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (345, 669, 145, 737);
INSERT INTO `tbl_fields_subsectionmanager_sorting` (`id`, `entry_id`, `field_id`, `order`) VALUES (349, 551, 145, 739);

-- *** STRUCTURE: `tbl_fields_taglist` ***
DROP TABLE IF EXISTS `tbl_fields_taglist`;
CREATE TABLE `tbl_fields_taglist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) DEFAULT NULL,
  `pre_populate_source` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `pre_populate_source` (`pre_populate_source`)
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_taglist` ***
INSERT INTO `tbl_fields_taglist` (`id`, `field_id`, `validator`, `pre_populate_source`) VALUES (131, 59, NULL, 'existing');
INSERT INTO `tbl_fields_taglist` (`id`, `field_id`, `validator`, `pre_populate_source`) VALUES (119, 84, NULL, 'existing');
INSERT INTO `tbl_fields_taglist` (`id`, `field_id`, `validator`, `pre_populate_source`) VALUES (101, 119, NULL, 'existing');
INSERT INTO `tbl_fields_taglist` (`id`, `field_id`, `validator`, `pre_populate_source`) VALUES (100, 129, NULL, 'existing');

-- *** STRUCTURE: `tbl_fields_textarea` ***
DROP TABLE IF EXISTS `tbl_fields_textarea`;
CREATE TABLE `tbl_fields_textarea` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `formatter` varchar(100) DEFAULT NULL,
  `size` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=324 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_textarea` ***
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (249, 17, 'markdown_with_purifier', 15);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (246, 26, 'markdown', 21);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (12, 35, 'markdown', 15);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (11, 37, 'markdown', 15);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (181, 39, 'markdown', 19);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (183, 43, 'markdown', 15);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (76, 47, 'markdown', 5);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (77, 48, 'markdown', 15);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (51, 52, NULL, 15);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (321, 55, 'markdown_extra_with_smartypants', 20);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (73, 68, 'markdown_with_purifier', 10);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (257, 77, NULL, 15);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (295, 81, 'markdown_extra_with_smartypants', 8);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (297, 82, 'markdown_extra', 15);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (203, 90, 'markdown_extra_with_smartypants', 5);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (115, 97, 'markdown_extra_with_smartypants', 15);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (259, 115, 'markdown_extra_with_smartypants', 15);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (254, 121, 'markdown_with_purifier', 15);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (255, 131, 'markdown', 15);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (323, 147, NULL, 15);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (299, 171, 'markdown_extra_with_smartypants', 20);

-- *** STRUCTURE: `tbl_fields_uniqueupload` ***
DROP TABLE IF EXISTS `tbl_fields_uniqueupload`;
CREATE TABLE `tbl_fields_uniqueupload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) NOT NULL,
  `validator` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_uniqueupload` ***

-- *** STRUCTURE: `tbl_fields_upload` ***
DROP TABLE IF EXISTS `tbl_fields_upload`;
CREATE TABLE `tbl_fields_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) NOT NULL,
  `validator` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=274 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_upload` ***
INSERT INTO `tbl_fields_upload` (`id`, `field_id`, `destination`, `validator`) VALUES (184, 31, '/workspace/assets/public/images/team', NULL);
INSERT INTO `tbl_fields_upload` (`id`, `field_id`, `destination`, `validator`) VALUES (185, 32, '/workspace/assets/public/images/team/avatar', NULL);
INSERT INTO `tbl_fields_upload` (`id`, `field_id`, `destination`, `validator`) VALUES (52, 49, '/workspace/assets/public/images/work', NULL);
INSERT INTO `tbl_fields_upload` (`id`, `field_id`, `destination`, `validator`) VALUES (121, 44, '/workspace/assets/public/images/work/thumb', NULL);
INSERT INTO `tbl_fields_upload` (`id`, `field_id`, `destination`, `validator`) VALUES (273, 61, '/workspace/assets/public/images/home', NULL);
INSERT INTO `tbl_fields_upload` (`id`, `field_id`, `destination`, `validator`) VALUES (271, 69, '/workspace/assets/public/images/articles', NULL);
INSERT INTO `tbl_fields_upload` (`id`, `field_id`, `destination`, `validator`) VALUES (247, 93, '/workspace/assets/resources/css', NULL);
INSERT INTO `tbl_fields_upload` (`id`, `field_id`, `destination`, `validator`) VALUES (249, 94, '/workspace/assets/resources/js', NULL);
INSERT INTO `tbl_fields_upload` (`id`, `field_id`, `destination`, `validator`) VALUES (159, 95, '/workspace/assets/resources/img', NULL);
INSERT INTO `tbl_fields_upload` (`id`, `field_id`, `destination`, `validator`) VALUES (245, 101, '/workspace/assets/resources/xml', NULL);
INSERT INTO `tbl_fields_upload` (`id`, `field_id`, `destination`, `validator`) VALUES (243, 165, '/workspace/assets/resources/files', '/\\.(?:doc|pdf|rtf|txt|zip)$/i');

-- *** STRUCTURE: `tbl_entries_data_1` ***
DROP TABLE IF EXISTS `tbl_entries_data_1`;
CREATE TABLE `tbl_entries_data_1` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_1` ***

-- *** STRUCTURE: `tbl_entries_data_10` ***
DROP TABLE IF EXISTS `tbl_entries_data_10`;
CREATE TABLE `tbl_entries_data_10` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_10` ***

-- *** STRUCTURE: `tbl_entries_data_100` ***
DROP TABLE IF EXISTS `tbl_entries_data_100`;
CREATE TABLE `tbl_entries_data_100` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_100` ***

-- *** STRUCTURE: `tbl_entries_data_101` ***
DROP TABLE IF EXISTS `tbl_entries_data_101`;
CREATE TABLE `tbl_entries_data_101` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `mimetype` varchar(50) DEFAULT NULL,
  `meta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_101` ***

-- *** STRUCTURE: `tbl_entries_data_102` ***
DROP TABLE IF EXISTS `tbl_entries_data_102`;
CREATE TABLE `tbl_entries_data_102` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_102` ***

-- *** STRUCTURE: `tbl_entries_data_103` ***
DROP TABLE IF EXISTS `tbl_entries_data_103`;
CREATE TABLE `tbl_entries_data_103` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_103` ***

-- *** STRUCTURE: `tbl_entries_data_105` ***
DROP TABLE IF EXISTS `tbl_entries_data_105`;
CREATE TABLE `tbl_entries_data_105` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_105` ***

-- *** STRUCTURE: `tbl_entries_data_106` ***
DROP TABLE IF EXISTS `tbl_entries_data_106`;
CREATE TABLE `tbl_entries_data_106` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_106` ***

-- *** STRUCTURE: `tbl_entries_data_107` ***
DROP TABLE IF EXISTS `tbl_entries_data_107`;
CREATE TABLE `tbl_entries_data_107` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_107` ***

-- *** STRUCTURE: `tbl_entries_data_108` ***
DROP TABLE IF EXISTS `tbl_entries_data_108`;
CREATE TABLE `tbl_entries_data_108` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_108` ***

-- *** STRUCTURE: `tbl_entries_data_109` ***
DROP TABLE IF EXISTS `tbl_entries_data_109`;
CREATE TABLE `tbl_entries_data_109` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_109` ***

-- *** STRUCTURE: `tbl_entries_data_110` ***
DROP TABLE IF EXISTS `tbl_entries_data_110`;
CREATE TABLE `tbl_entries_data_110` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_110` ***

-- *** STRUCTURE: `tbl_entries_data_112` ***
DROP TABLE IF EXISTS `tbl_entries_data_112`;
CREATE TABLE `tbl_entries_data_112` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `author_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `author_id` (`author_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_112` ***

-- *** STRUCTURE: `tbl_entries_data_114` ***
DROP TABLE IF EXISTS `tbl_entries_data_114`;
CREATE TABLE `tbl_entries_data_114` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_114` ***

-- *** STRUCTURE: `tbl_entries_data_115` ***
DROP TABLE IF EXISTS `tbl_entries_data_115`;
CREATE TABLE `tbl_entries_data_115` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_115` ***

-- *** STRUCTURE: `tbl_entries_data_116` ***
DROP TABLE IF EXISTS `tbl_entries_data_116`;
CREATE TABLE `tbl_entries_data_116` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_116` ***

-- *** STRUCTURE: `tbl_entries_data_117` ***
DROP TABLE IF EXISTS `tbl_entries_data_117`;
CREATE TABLE `tbl_entries_data_117` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) DEFAULT NULL,
  `local` int(11) DEFAULT NULL,
  `gmt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_117` ***

-- *** STRUCTURE: `tbl_entries_data_118` ***
DROP TABLE IF EXISTS `tbl_entries_data_118`;
CREATE TABLE `tbl_entries_data_118` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_118` ***

-- *** STRUCTURE: `tbl_entries_data_119` ***
DROP TABLE IF EXISTS `tbl_entries_data_119`;
CREATE TABLE `tbl_entries_data_119` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_119` ***

-- *** STRUCTURE: `tbl_entries_data_12` ***
DROP TABLE IF EXISTS `tbl_entries_data_12`;
CREATE TABLE `tbl_entries_data_12` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) DEFAULT NULL,
  `local` int(11) DEFAULT NULL,
  `gmt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_12` ***

-- *** STRUCTURE: `tbl_entries_data_120` ***
DROP TABLE IF EXISTS `tbl_entries_data_120`;
CREATE TABLE `tbl_entries_data_120` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_120` ***

-- *** STRUCTURE: `tbl_entries_data_121` ***
DROP TABLE IF EXISTS `tbl_entries_data_121`;
CREATE TABLE `tbl_entries_data_121` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_121` ***

-- *** STRUCTURE: `tbl_entries_data_122` ***
DROP TABLE IF EXISTS `tbl_entries_data_122`;
CREATE TABLE `tbl_entries_data_122` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_122` ***

-- *** STRUCTURE: `tbl_entries_data_123` ***
DROP TABLE IF EXISTS `tbl_entries_data_123`;
CREATE TABLE `tbl_entries_data_123` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_123` ***

-- *** STRUCTURE: `tbl_entries_data_124` ***
DROP TABLE IF EXISTS `tbl_entries_data_124`;
CREATE TABLE `tbl_entries_data_124` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) DEFAULT NULL,
  `local` int(11) DEFAULT NULL,
  `gmt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_124` ***

-- *** STRUCTURE: `tbl_entries_data_125` ***
DROP TABLE IF EXISTS `tbl_entries_data_125`;
CREATE TABLE `tbl_entries_data_125` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_125` ***

-- *** STRUCTURE: `tbl_entries_data_127` ***
DROP TABLE IF EXISTS `tbl_entries_data_127`;
CREATE TABLE `tbl_entries_data_127` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_127` ***

-- *** STRUCTURE: `tbl_entries_data_129` ***
DROP TABLE IF EXISTS `tbl_entries_data_129`;
CREATE TABLE `tbl_entries_data_129` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_129` ***

-- *** STRUCTURE: `tbl_entries_data_131` ***
DROP TABLE IF EXISTS `tbl_entries_data_131`;
CREATE TABLE `tbl_entries_data_131` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_131` ***

-- *** STRUCTURE: `tbl_entries_data_135` ***
DROP TABLE IF EXISTS `tbl_entries_data_135`;
CREATE TABLE `tbl_entries_data_135` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) DEFAULT NULL,
  `local` int(11) DEFAULT NULL,
  `gmt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_135` ***

-- *** STRUCTURE: `tbl_entries_data_137` ***
DROP TABLE IF EXISTS `tbl_entries_data_137`;
CREATE TABLE `tbl_entries_data_137` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_137` ***

-- *** STRUCTURE: `tbl_entries_data_138` ***
DROP TABLE IF EXISTS `tbl_entries_data_138`;
CREATE TABLE `tbl_entries_data_138` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `member_id` (`member_id`),
  KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_138` ***

-- *** STRUCTURE: `tbl_entries_data_14` ***
DROP TABLE IF EXISTS `tbl_entries_data_14`;
CREATE TABLE `tbl_entries_data_14` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) DEFAULT NULL,
  `local` int(11) DEFAULT NULL,
  `gmt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_14` ***

-- *** STRUCTURE: `tbl_entries_data_141` ***
DROP TABLE IF EXISTS `tbl_entries_data_141`;
CREATE TABLE `tbl_entries_data_141` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_141` ***

-- *** STRUCTURE: `tbl_entries_data_143` ***
DROP TABLE IF EXISTS `tbl_entries_data_143`;
CREATE TABLE `tbl_entries_data_143` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_143` ***

-- *** STRUCTURE: `tbl_entries_data_145` ***
DROP TABLE IF EXISTS `tbl_entries_data_145`;
CREATE TABLE `tbl_entries_data_145` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_145` ***

-- *** STRUCTURE: `tbl_entries_data_147` ***
DROP TABLE IF EXISTS `tbl_entries_data_147`;
CREATE TABLE `tbl_entries_data_147` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_147` ***

-- *** STRUCTURE: `tbl_entries_data_148` ***
DROP TABLE IF EXISTS `tbl_entries_data_148`;
CREATE TABLE `tbl_entries_data_148` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`value`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_148` ***

-- *** STRUCTURE: `tbl_entries_data_149` ***
DROP TABLE IF EXISTS `tbl_entries_data_149`;
CREATE TABLE `tbl_entries_data_149` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`value`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_149` ***

-- *** STRUCTURE: `tbl_entries_data_15` ***
DROP TABLE IF EXISTS `tbl_entries_data_15`;
CREATE TABLE `tbl_entries_data_15` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_15` ***

-- *** STRUCTURE: `tbl_entries_data_150` ***
DROP TABLE IF EXISTS `tbl_entries_data_150`;
CREATE TABLE `tbl_entries_data_150` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `password` varchar(40) DEFAULT NULL,
  `recovery-code` varchar(40) DEFAULT NULL,
  `length` tinyint(2) NOT NULL,
  `strength` enum('weak','good','strong') NOT NULL,
  `reset` enum('yes','no') DEFAULT 'no',
  `expires` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `length` (`length`),
  KEY `password` (`password`),
  KEY `expires` (`expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_150` ***

-- *** STRUCTURE: `tbl_entries_data_151` ***
DROP TABLE IF EXISTS `tbl_entries_data_151`;
CREATE TABLE `tbl_entries_data_151` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `role_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_151` ***

-- *** STRUCTURE: `tbl_entries_data_152` ***
DROP TABLE IF EXISTS `tbl_entries_data_152`;
CREATE TABLE `tbl_entries_data_152` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `activated` enum('yes','no') NOT NULL DEFAULT 'no',
  `timestamp` datetime DEFAULT NULL,
  `code` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_152` ***

-- *** STRUCTURE: `tbl_entries_data_153` ***
DROP TABLE IF EXISTS `tbl_entries_data_153`;
CREATE TABLE `tbl_entries_data_153` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_153` ***

-- *** STRUCTURE: `tbl_entries_data_154` ***
DROP TABLE IF EXISTS `tbl_entries_data_154`;
CREATE TABLE `tbl_entries_data_154` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_154` ***

-- *** STRUCTURE: `tbl_entries_data_155` ***
DROP TABLE IF EXISTS `tbl_entries_data_155`;
CREATE TABLE `tbl_entries_data_155` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_155` ***

-- *** STRUCTURE: `tbl_entries_data_156` ***
DROP TABLE IF EXISTS `tbl_entries_data_156`;
CREATE TABLE `tbl_entries_data_156` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`value`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_entries_data_156` ***

-- *** STRUCTURE: `tbl_entries_data_157` ***
DROP TABLE IF EXISTS `tbl_entries_data_157`;
CREATE TABLE `tbl_entries_data_157` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_157` ***

-- *** STRUCTURE: `tbl_entries_data_158` ***
DROP TABLE IF EXISTS `tbl_entries_data_158`;
CREATE TABLE `tbl_entries_data_158` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_158` ***

-- *** STRUCTURE: `tbl_entries_data_159` ***
DROP TABLE IF EXISTS `tbl_entries_data_159`;
CREATE TABLE `tbl_entries_data_159` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) DEFAULT NULL,
  `local` int(11) DEFAULT NULL,
  `gmt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_159` ***

-- *** STRUCTURE: `tbl_entries_data_16` ***
DROP TABLE IF EXISTS `tbl_entries_data_16`;
CREATE TABLE `tbl_entries_data_16` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_16` ***

-- *** STRUCTURE: `tbl_entries_data_160` ***
DROP TABLE IF EXISTS `tbl_entries_data_160`;
CREATE TABLE `tbl_entries_data_160` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_160` ***

-- *** STRUCTURE: `tbl_entries_data_161` ***
DROP TABLE IF EXISTS `tbl_entries_data_161`;
CREATE TABLE `tbl_entries_data_161` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_161` ***

-- *** STRUCTURE: `tbl_entries_data_162` ***
DROP TABLE IF EXISTS `tbl_entries_data_162`;
CREATE TABLE `tbl_entries_data_162` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_162` ***

-- *** STRUCTURE: `tbl_entries_data_163` ***
DROP TABLE IF EXISTS `tbl_entries_data_163`;
CREATE TABLE `tbl_entries_data_163` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) DEFAULT NULL,
  `local` int(11) DEFAULT NULL,
  `gmt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_163` ***

-- *** STRUCTURE: `tbl_entries_data_165` ***
DROP TABLE IF EXISTS `tbl_entries_data_165`;
CREATE TABLE `tbl_entries_data_165` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `mimetype` varchar(50) DEFAULT NULL,
  `meta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_165` ***

-- *** STRUCTURE: `tbl_entries_data_167` ***
DROP TABLE IF EXISTS `tbl_entries_data_167`;
CREATE TABLE `tbl_entries_data_167` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_167` ***

-- *** STRUCTURE: `tbl_entries_data_169` ***
DROP TABLE IF EXISTS `tbl_entries_data_169`;
CREATE TABLE `tbl_entries_data_169` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_169` ***

-- *** STRUCTURE: `tbl_entries_data_17` ***
DROP TABLE IF EXISTS `tbl_entries_data_17`;
CREATE TABLE `tbl_entries_data_17` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_17` ***

-- *** STRUCTURE: `tbl_entries_data_171` ***
DROP TABLE IF EXISTS `tbl_entries_data_171`;
CREATE TABLE `tbl_entries_data_171` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_171` ***

-- *** STRUCTURE: `tbl_entries_data_173` ***
DROP TABLE IF EXISTS `tbl_entries_data_173`;
CREATE TABLE `tbl_entries_data_173` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) DEFAULT NULL,
  `local` int(11) DEFAULT NULL,
  `gmt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_173` ***

-- *** STRUCTURE: `tbl_entries_data_175` ***
DROP TABLE IF EXISTS `tbl_entries_data_175`;
CREATE TABLE `tbl_entries_data_175` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_175` ***

-- *** STRUCTURE: `tbl_entries_data_177` ***
DROP TABLE IF EXISTS `tbl_entries_data_177`;
CREATE TABLE `tbl_entries_data_177` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_177` ***

-- *** STRUCTURE: `tbl_entries_data_18` ***
DROP TABLE IF EXISTS `tbl_entries_data_18`;
CREATE TABLE `tbl_entries_data_18` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_18` ***

-- *** STRUCTURE: `tbl_entries_data_19` ***
DROP TABLE IF EXISTS `tbl_entries_data_19`;
CREATE TABLE `tbl_entries_data_19` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) DEFAULT NULL,
  `local` int(11) DEFAULT NULL,
  `gmt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_19` ***

-- *** STRUCTURE: `tbl_entries_data_22` ***
DROP TABLE IF EXISTS `tbl_entries_data_22`;
CREATE TABLE `tbl_entries_data_22` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_22` ***

-- *** STRUCTURE: `tbl_entries_data_23` ***
DROP TABLE IF EXISTS `tbl_entries_data_23`;
CREATE TABLE `tbl_entries_data_23` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_23` ***

-- *** STRUCTURE: `tbl_entries_data_24` ***
DROP TABLE IF EXISTS `tbl_entries_data_24`;
CREATE TABLE `tbl_entries_data_24` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_24` ***

-- *** STRUCTURE: `tbl_entries_data_25` ***
DROP TABLE IF EXISTS `tbl_entries_data_25`;
CREATE TABLE `tbl_entries_data_25` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_25` ***

-- *** STRUCTURE: `tbl_entries_data_26` ***
DROP TABLE IF EXISTS `tbl_entries_data_26`;
CREATE TABLE `tbl_entries_data_26` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_26` ***

-- *** STRUCTURE: `tbl_entries_data_27` ***
DROP TABLE IF EXISTS `tbl_entries_data_27`;
CREATE TABLE `tbl_entries_data_27` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_27` ***

-- *** STRUCTURE: `tbl_entries_data_28` ***
DROP TABLE IF EXISTS `tbl_entries_data_28`;
CREATE TABLE `tbl_entries_data_28` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_28` ***

-- *** STRUCTURE: `tbl_entries_data_29` ***
DROP TABLE IF EXISTS `tbl_entries_data_29`;
CREATE TABLE `tbl_entries_data_29` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_29` ***

-- *** STRUCTURE: `tbl_entries_data_3` ***
DROP TABLE IF EXISTS `tbl_entries_data_3`;
CREATE TABLE `tbl_entries_data_3` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_3` ***

-- *** STRUCTURE: `tbl_entries_data_30` ***
DROP TABLE IF EXISTS `tbl_entries_data_30`;
CREATE TABLE `tbl_entries_data_30` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_30` ***

-- *** STRUCTURE: `tbl_entries_data_31` ***
DROP TABLE IF EXISTS `tbl_entries_data_31`;
CREATE TABLE `tbl_entries_data_31` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `mimetype` varchar(50) DEFAULT NULL,
  `meta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_31` ***

-- *** STRUCTURE: `tbl_entries_data_32` ***
DROP TABLE IF EXISTS `tbl_entries_data_32`;
CREATE TABLE `tbl_entries_data_32` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `mimetype` varchar(50) DEFAULT NULL,
  `meta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_32` ***

-- *** STRUCTURE: `tbl_entries_data_33` ***
DROP TABLE IF EXISTS `tbl_entries_data_33`;
CREATE TABLE `tbl_entries_data_33` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) DEFAULT NULL,
  `local` int(11) DEFAULT NULL,
  `gmt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_33` ***

-- *** STRUCTURE: `tbl_entries_data_34` ***
DROP TABLE IF EXISTS `tbl_entries_data_34`;
CREATE TABLE `tbl_entries_data_34` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_34` ***

-- *** STRUCTURE: `tbl_entries_data_35` ***
DROP TABLE IF EXISTS `tbl_entries_data_35`;
CREATE TABLE `tbl_entries_data_35` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_35` ***

-- *** STRUCTURE: `tbl_entries_data_36` ***
DROP TABLE IF EXISTS `tbl_entries_data_36`;
CREATE TABLE `tbl_entries_data_36` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_36` ***

-- *** STRUCTURE: `tbl_entries_data_37` ***
DROP TABLE IF EXISTS `tbl_entries_data_37`;
CREATE TABLE `tbl_entries_data_37` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_37` ***

-- *** STRUCTURE: `tbl_entries_data_38` ***
DROP TABLE IF EXISTS `tbl_entries_data_38`;
CREATE TABLE `tbl_entries_data_38` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_38` ***

-- *** STRUCTURE: `tbl_entries_data_39` ***
DROP TABLE IF EXISTS `tbl_entries_data_39`;
CREATE TABLE `tbl_entries_data_39` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_39` ***

-- *** STRUCTURE: `tbl_entries_data_40` ***
DROP TABLE IF EXISTS `tbl_entries_data_40`;
CREATE TABLE `tbl_entries_data_40` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_40` ***

-- *** STRUCTURE: `tbl_entries_data_41` ***
DROP TABLE IF EXISTS `tbl_entries_data_41`;
CREATE TABLE `tbl_entries_data_41` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_41` ***

-- *** STRUCTURE: `tbl_entries_data_42` ***
DROP TABLE IF EXISTS `tbl_entries_data_42`;
CREATE TABLE `tbl_entries_data_42` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_42` ***

-- *** STRUCTURE: `tbl_entries_data_43` ***
DROP TABLE IF EXISTS `tbl_entries_data_43`;
CREATE TABLE `tbl_entries_data_43` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_43` ***

-- *** STRUCTURE: `tbl_entries_data_44` ***
DROP TABLE IF EXISTS `tbl_entries_data_44`;
CREATE TABLE `tbl_entries_data_44` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `mimetype` varchar(50) DEFAULT NULL,
  `meta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_44` ***

-- *** STRUCTURE: `tbl_entries_data_45` ***
DROP TABLE IF EXISTS `tbl_entries_data_45`;
CREATE TABLE `tbl_entries_data_45` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) DEFAULT NULL,
  `local` int(11) DEFAULT NULL,
  `gmt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_45` ***

-- *** STRUCTURE: `tbl_entries_data_46` ***
DROP TABLE IF EXISTS `tbl_entries_data_46`;
CREATE TABLE `tbl_entries_data_46` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_46` ***

-- *** STRUCTURE: `tbl_entries_data_47` ***
DROP TABLE IF EXISTS `tbl_entries_data_47`;
CREATE TABLE `tbl_entries_data_47` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_47` ***

-- *** STRUCTURE: `tbl_entries_data_48` ***
DROP TABLE IF EXISTS `tbl_entries_data_48`;
CREATE TABLE `tbl_entries_data_48` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_48` ***

-- *** STRUCTURE: `tbl_entries_data_49` ***
DROP TABLE IF EXISTS `tbl_entries_data_49`;
CREATE TABLE `tbl_entries_data_49` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `mimetype` varchar(50) DEFAULT NULL,
  `meta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_49` ***

-- *** STRUCTURE: `tbl_entries_data_50` ***
DROP TABLE IF EXISTS `tbl_entries_data_50`;
CREATE TABLE `tbl_entries_data_50` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_50` ***

-- *** STRUCTURE: `tbl_entries_data_51` ***
DROP TABLE IF EXISTS `tbl_entries_data_51`;
CREATE TABLE `tbl_entries_data_51` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_51` ***

-- *** STRUCTURE: `tbl_entries_data_52` ***
DROP TABLE IF EXISTS `tbl_entries_data_52`;
CREATE TABLE `tbl_entries_data_52` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_52` ***

-- *** STRUCTURE: `tbl_entries_data_53` ***
DROP TABLE IF EXISTS `tbl_entries_data_53`;
CREATE TABLE `tbl_entries_data_53` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_53` ***

-- *** STRUCTURE: `tbl_entries_data_54` ***
DROP TABLE IF EXISTS `tbl_entries_data_54`;
CREATE TABLE `tbl_entries_data_54` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_54` ***

-- *** STRUCTURE: `tbl_entries_data_55` ***
DROP TABLE IF EXISTS `tbl_entries_data_55`;
CREATE TABLE `tbl_entries_data_55` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_55` ***

-- *** STRUCTURE: `tbl_entries_data_56` ***
DROP TABLE IF EXISTS `tbl_entries_data_56`;
CREATE TABLE `tbl_entries_data_56` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_56` ***

-- *** STRUCTURE: `tbl_entries_data_57` ***
DROP TABLE IF EXISTS `tbl_entries_data_57`;
CREATE TABLE `tbl_entries_data_57` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) DEFAULT NULL,
  `local` int(11) DEFAULT NULL,
  `gmt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_57` ***

-- *** STRUCTURE: `tbl_entries_data_58` ***
DROP TABLE IF EXISTS `tbl_entries_data_58`;
CREATE TABLE `tbl_entries_data_58` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_58` ***

-- *** STRUCTURE: `tbl_entries_data_59` ***
DROP TABLE IF EXISTS `tbl_entries_data_59`;
CREATE TABLE `tbl_entries_data_59` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_59` ***

-- *** STRUCTURE: `tbl_entries_data_6` ***
DROP TABLE IF EXISTS `tbl_entries_data_6`;
CREATE TABLE `tbl_entries_data_6` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_6` ***

-- *** STRUCTURE: `tbl_entries_data_60` ***
DROP TABLE IF EXISTS `tbl_entries_data_60`;
CREATE TABLE `tbl_entries_data_60` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_60` ***

-- *** STRUCTURE: `tbl_entries_data_61` ***
DROP TABLE IF EXISTS `tbl_entries_data_61`;
CREATE TABLE `tbl_entries_data_61` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `mimetype` varchar(50) DEFAULT NULL,
  `meta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_61` ***

-- *** STRUCTURE: `tbl_entries_data_62` ***
DROP TABLE IF EXISTS `tbl_entries_data_62`;
CREATE TABLE `tbl_entries_data_62` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_62` ***

-- *** STRUCTURE: `tbl_entries_data_63` ***
DROP TABLE IF EXISTS `tbl_entries_data_63`;
CREATE TABLE `tbl_entries_data_63` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_63` ***

-- *** STRUCTURE: `tbl_entries_data_64` ***
DROP TABLE IF EXISTS `tbl_entries_data_64`;
CREATE TABLE `tbl_entries_data_64` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_64` ***

-- *** STRUCTURE: `tbl_entries_data_65` ***
DROP TABLE IF EXISTS `tbl_entries_data_65`;
CREATE TABLE `tbl_entries_data_65` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_65` ***

-- *** STRUCTURE: `tbl_entries_data_66` ***
DROP TABLE IF EXISTS `tbl_entries_data_66`;
CREATE TABLE `tbl_entries_data_66` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) DEFAULT NULL,
  `local` int(11) DEFAULT NULL,
  `gmt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_66` ***

-- *** STRUCTURE: `tbl_entries_data_67` ***
DROP TABLE IF EXISTS `tbl_entries_data_67`;
CREATE TABLE `tbl_entries_data_67` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_67` ***

-- *** STRUCTURE: `tbl_entries_data_68` ***
DROP TABLE IF EXISTS `tbl_entries_data_68`;
CREATE TABLE `tbl_entries_data_68` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_68` ***

-- *** STRUCTURE: `tbl_entries_data_69` ***
DROP TABLE IF EXISTS `tbl_entries_data_69`;
CREATE TABLE `tbl_entries_data_69` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `mimetype` varchar(50) DEFAULT NULL,
  `meta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_69` ***

-- *** STRUCTURE: `tbl_entries_data_7` ***
DROP TABLE IF EXISTS `tbl_entries_data_7`;
CREATE TABLE `tbl_entries_data_7` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_7` ***

-- *** STRUCTURE: `tbl_entries_data_70` ***
DROP TABLE IF EXISTS `tbl_entries_data_70`;
CREATE TABLE `tbl_entries_data_70` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_70` ***

-- *** STRUCTURE: `tbl_entries_data_71` ***
DROP TABLE IF EXISTS `tbl_entries_data_71`;
CREATE TABLE `tbl_entries_data_71` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_71` ***

-- *** STRUCTURE: `tbl_entries_data_72` ***
DROP TABLE IF EXISTS `tbl_entries_data_72`;
CREATE TABLE `tbl_entries_data_72` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) DEFAULT NULL,
  `local` int(11) DEFAULT NULL,
  `gmt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_72` ***

-- *** STRUCTURE: `tbl_entries_data_73` ***
DROP TABLE IF EXISTS `tbl_entries_data_73`;
CREATE TABLE `tbl_entries_data_73` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_73` ***

-- *** STRUCTURE: `tbl_entries_data_74` ***
DROP TABLE IF EXISTS `tbl_entries_data_74`;
CREATE TABLE `tbl_entries_data_74` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_74` ***

-- *** STRUCTURE: `tbl_entries_data_75` ***
DROP TABLE IF EXISTS `tbl_entries_data_75`;
CREATE TABLE `tbl_entries_data_75` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_75` ***

-- *** STRUCTURE: `tbl_entries_data_76` ***
DROP TABLE IF EXISTS `tbl_entries_data_76`;
CREATE TABLE `tbl_entries_data_76` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_76` ***

-- *** STRUCTURE: `tbl_entries_data_77` ***
DROP TABLE IF EXISTS `tbl_entries_data_77`;
CREATE TABLE `tbl_entries_data_77` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_77` ***

-- *** STRUCTURE: `tbl_entries_data_78` ***
DROP TABLE IF EXISTS `tbl_entries_data_78`;
CREATE TABLE `tbl_entries_data_78` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_78` ***

-- *** STRUCTURE: `tbl_entries_data_79` ***
DROP TABLE IF EXISTS `tbl_entries_data_79`;
CREATE TABLE `tbl_entries_data_79` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_79` ***

-- *** STRUCTURE: `tbl_entries_data_80` ***
DROP TABLE IF EXISTS `tbl_entries_data_80`;
CREATE TABLE `tbl_entries_data_80` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_80` ***

-- *** STRUCTURE: `tbl_entries_data_81` ***
DROP TABLE IF EXISTS `tbl_entries_data_81`;
CREATE TABLE `tbl_entries_data_81` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_81` ***

-- *** STRUCTURE: `tbl_entries_data_82` ***
DROP TABLE IF EXISTS `tbl_entries_data_82`;
CREATE TABLE `tbl_entries_data_82` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_82` ***

-- *** STRUCTURE: `tbl_entries_data_83` ***
DROP TABLE IF EXISTS `tbl_entries_data_83`;
CREATE TABLE `tbl_entries_data_83` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_83` ***

-- *** STRUCTURE: `tbl_entries_data_84` ***
DROP TABLE IF EXISTS `tbl_entries_data_84`;
CREATE TABLE `tbl_entries_data_84` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_84` ***

-- *** STRUCTURE: `tbl_entries_data_85` ***
DROP TABLE IF EXISTS `tbl_entries_data_85`;
CREATE TABLE `tbl_entries_data_85` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) DEFAULT NULL,
  `local` int(11) DEFAULT NULL,
  `gmt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_85` ***

-- *** STRUCTURE: `tbl_entries_data_86` ***
DROP TABLE IF EXISTS `tbl_entries_data_86`;
CREATE TABLE `tbl_entries_data_86` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_86` ***

-- *** STRUCTURE: `tbl_entries_data_87` ***
DROP TABLE IF EXISTS `tbl_entries_data_87`;
CREATE TABLE `tbl_entries_data_87` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_87` ***

-- *** STRUCTURE: `tbl_entries_data_88` ***
DROP TABLE IF EXISTS `tbl_entries_data_88`;
CREATE TABLE `tbl_entries_data_88` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `last_modified_author` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_88` ***

-- *** STRUCTURE: `tbl_entries_data_89` ***
DROP TABLE IF EXISTS `tbl_entries_data_89`;
CREATE TABLE `tbl_entries_data_89` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_89` ***

-- *** STRUCTURE: `tbl_entries_data_9` ***
DROP TABLE IF EXISTS `tbl_entries_data_9`;
CREATE TABLE `tbl_entries_data_9` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_9` ***

-- *** STRUCTURE: `tbl_entries_data_90` ***
DROP TABLE IF EXISTS `tbl_entries_data_90`;
CREATE TABLE `tbl_entries_data_90` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_90` ***

-- *** STRUCTURE: `tbl_entries_data_91` ***
DROP TABLE IF EXISTS `tbl_entries_data_91`;
CREATE TABLE `tbl_entries_data_91` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_91` ***

-- *** STRUCTURE: `tbl_entries_data_92` ***
DROP TABLE IF EXISTS `tbl_entries_data_92`;
CREATE TABLE `tbl_entries_data_92` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_92` ***

-- *** STRUCTURE: `tbl_entries_data_93` ***
DROP TABLE IF EXISTS `tbl_entries_data_93`;
CREATE TABLE `tbl_entries_data_93` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `mimetype` varchar(50) DEFAULT NULL,
  `meta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_93` ***

-- *** STRUCTURE: `tbl_entries_data_94` ***
DROP TABLE IF EXISTS `tbl_entries_data_94`;
CREATE TABLE `tbl_entries_data_94` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `mimetype` varchar(50) DEFAULT NULL,
  `meta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_94` ***

-- *** STRUCTURE: `tbl_entries_data_95` ***
DROP TABLE IF EXISTS `tbl_entries_data_95`;
CREATE TABLE `tbl_entries_data_95` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `mimetype` varchar(50) DEFAULT NULL,
  `meta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_95` ***

-- *** STRUCTURE: `tbl_entries_data_96` ***
DROP TABLE IF EXISTS `tbl_entries_data_96`;
CREATE TABLE `tbl_entries_data_96` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_96` ***

-- *** STRUCTURE: `tbl_entries_data_97` ***
DROP TABLE IF EXISTS `tbl_entries_data_97`;
CREATE TABLE `tbl_entries_data_97` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext,
  `value_formatted` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_97` ***

-- *** STRUCTURE: `tbl_entries_data_98` ***
DROP TABLE IF EXISTS `tbl_entries_data_98`;
CREATE TABLE `tbl_entries_data_98` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_98` ***

-- *** STRUCTURE: `tbl_entries_data_99` ***
DROP TABLE IF EXISTS `tbl_entries_data_99`;
CREATE TABLE `tbl_entries_data_99` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_99` ***

-- *** DATA: `tbl_entries` ***

-- *** DATA: `tbl_extensions` ***
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (53, 'debugdevkit', 'enabled', '1.2.1');
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (15, 'export_ensemble', 'enabled', 1.16);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (3, 'selectbox_link_field', 'enabled', 1.22);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (23, 'jit_image_manipulation', 'enabled', 1.13);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (5, 'maintenance_mode', 'enabled', 1.5);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (6, 'profiledevkit', 'enabled', '1.0.4');
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (21, 'markdown', 'enabled', 1.13);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (9, 'content_type_mappings', 'enabled', 1.3);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (10, 'numberfield', 'enabled', 1.4);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (22, 'xssfilter', 'enabled', 1.1);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (31, 'html5_doctype', 'enabled', '1.2.5');
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (26, 'field_metakeys', 'enabled', '0.9.4');
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (27, 'subsectionmanager', 'enabled', 1.3);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (32, 'order_entries', 'enabled', '1.9.7');
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (33, 'edui', 'enabled', '0.6.1');
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (34, 'dump_db', 'enabled', 1.08);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (46, 'author_login', 'enabled', 1.0);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (56, 'members', 'enabled', '1.1.1');
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (59, 'email_template_manager', 'enabled', 3.0);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (61, 'entity_diagram', 'enabled', '1.4.5');
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (62, 'forum', 'enabled', '2.0 Alpha');
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (63, 'asdc', 'enabled', 1.3);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (64, 'publishfiltering', 'enabled', '1.6.1');
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (65, 'dynamic_event_redirect', 'enabled', '1.0.2');
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (67, 'readonly_mode', 'enabled', 1.2);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (71, 'uniqueuploadfield', 'enabled', '1.4.2');
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (73, 'entry_url_field', 'enabled', 1.1);

-- *** DATA: `tbl_extensions_delegates` ***
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (292, 53, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (287, 15, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (299, 5, '/blueprints/pages/', 'AppendPageContent', '__appendType');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (298, 5, '/backend/', 'AppendPageAlert', '__appendAlert');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (297, 5, '/system/preferences/', 'CustomActions', '__toggleMaintenanceMode');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (296, 5, '/system/preferences/', 'Save', '__SavePreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (12, 6, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (13, 6, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (14, 9, '/frontend/', 'FrontendPreRenderHeaders', 'setContentType');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (339, 56, '/system/preferences/', 'Save', 'savePreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (338, 56, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (279, 59, '/blueprints/datasources/', 'DatasourcePostEdit', 'DatasourcePostEdit');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (277, 59, '/blueprints/events/edit/', 'AppendEventFilterDocumentation', 'AppendEventFilterDocumentation');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (275, 59, '/frontend/', 'EventFinalSaveFilter', 'eventFinalSaveFilter');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (273, 59, '/blueprints/events/new/', 'AppendEventFilter', 'AppendEventFilter');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (271, 59, '/blueprints/events/edit/', 'AppendEventFilter', 'AppendEventFilter');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (304, 33, '/backend/', 'AdminPagePreGenerate', 'setRedirects');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (289, 22, '/blueprints/events/edit/', 'AppendEventFilter', 'appendEventFilter');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (288, 22, '/blueprints/events/new/', 'AppendEventFilter', 'appendEventFilter');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (331, 27, '/backend/', 'AppendPageAlert', '__upgradeMediathek');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (330, 27, '/publish/edit/', 'EntryPostEdit', '__saveSortOrder');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (329, 27, '/publish/new/', 'EntryPostNew', '__saveSortOrder');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (295, 5, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (326, 67, '/frontend/', 'EventPreSaveFilter', 'preEvent');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (316, 32, '/backend/', 'InitaliseAdminPageHead', 'appendScriptToHead');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (303, 33, '/backend/', 'NavigationPreRender', 'deleteComponentsItem');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (164, 34, '/backend/', 'InitaliseAdminPageHead', 'initaliseAdminPageHead');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (163, 34, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (95, 46, '/frontend/', 'FrontendParamsResolve', 'addParamToPage');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (96, 46, '/frontend/', 'FrontendProcessEvents', 'appendAuthorLoginToEventXML');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (291, 53, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (305, 31, '/frontend/', 'FrontendOutputPostGenerate', 'parse_html');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (337, 56, '/backend/', 'AdminPagePreGenerate', 'appendAssets');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (336, 56, '/frontend/', 'EventPostSaveFilter', 'processPostSaveFilter');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (165, 34, '/backend/', 'AppendPageAlert', 'appendAlert');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (328, 27, '/backend/', 'AdminPagePreGenerate', '__appendAssets');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (302, 61, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (204, 62, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (320, 64, '/blueprints/sections/', 'SectionPreEdit', 'saveSectionSettings');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (319, 64, '/blueprints/sections/', 'SectionPreCreate', 'saveSectionSettings');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (318, 64, '/blueprints/sections/', 'AddSectionElements', 'addSectionSetting');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (317, 64, '/backend/', 'InitaliseAdminPageHead', 'initaliseAdminPageHead');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (214, 65, '/blueprints/events/edit/', 'AppendEventFilter', 'add_filter_to_event_editor');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (215, 65, '/blueprints/events/new/', 'AppendEventFilter', 'add_filter_to_event_editor');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (216, 65, '/blueprints/events/new/', 'AppendEventFilterDocumentation', 'add_filter_documentation_to_event');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (217, 65, '/blueprints/events/edit/', 'AppendEventFilterDocumentation', 'add_filter_documentation_to_event');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (218, 65, '/frontend/', 'EventFinalSaveFilter', 'process_redirect');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (293, 23, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (325, 67, '/backend/', 'AdminPagePreGenerate', 'preGenerate');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (324, 67, '/system/preferences/', 'CustomActions', '__toggleReadonlyMode');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (323, 67, '/backend/', 'AppendPageAlert', '__appendAlert');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (322, 67, '/system/preferences/', 'Save', '__SavePreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (321, 67, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (334, 56, '/frontend/', 'FrontendProcessEvents', 'appendLoginStatusToEventXML');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (335, 56, '/frontend/', 'EventPreSaveFilter', 'checkEventPermissions');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (281, 73, '/publish/new/', 'EntryPostCreate', 'compileBackendFields');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (283, 73, '/publish/edit/', 'EntryPostEdit', 'compileBackendFields');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (285, 73, '/frontend/', 'EventPostSaveFilter', 'compileFrontendFields');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (290, 22, '/frontend/', 'EventPreSaveFilter', 'eventPreSaveFilter');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (294, 23, '/system/preferences/', 'Save', '__SavePreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (300, 5, '/frontend/', 'FrontendPrePageResolve', '__checkForMaintenanceMode');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (301, 5, '/frontend/', 'FrontendParamsResolve', '__addParam');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (340, 56, '/blueprints/events/new/', 'AppendEventFilter', 'appendFilter');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (333, 56, '/frontend/', 'FrontendParamsResolve', 'addMemberDetailsToPageParams');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (332, 56, '/frontend/', 'FrontendPageResolved', 'checkFrontendPagePermissions');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (327, 67, '/frontend/', 'FrontendParamsResolve', '__addParam');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (341, 56, '/blueprints/events/edit/', 'AppendEventFilter', 'appendFilter');

-- *** DATA: `tbl_fields` ***
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (1, 'Name', 'name', 'input', 1, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (3, 'Website', 'website', 'input', 1, 'no', 6, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (148, 'Username', 'username', 'memberusername', 1, 'yes', 1, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (6, 'Location', 'location', 'input', 1, 'no', 7, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (7, 'City', 'city', 'input', 1, 'no', 8, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (9, 'Email Opt-in', 'email-opt-in', 'checkbox', 1, 'no', 10, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (10, 'Topic', 'topic', 'input', 2, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (12, 'Creation Date', 'creation-date', 'date', 2, 'no', 2, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (14, 'Last Active', 'last-active', 'date', 2, 'no', 4, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (15, 'Pinned', 'pinned', 'checkbox', 2, 'no', 5, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (16, 'Closed', 'closed', 'checkbox', 2, 'no', 6, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (17, 'Comment', 'comment', 'textarea', 3, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (18, 'Parent ID', 'parent-id', 'selectbox_link', 3, 'yes', 1, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (19, 'Date', 'date', 'date', 3, 'no', 2, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (22, 'Member', 'member', 'selectbox_link', 4, 'yes', 0, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (23, 'First Name', 'first-name', 'input', 4, 'no', 2, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (24, 'Last Name', 'last-name', 'input', 4, 'no', 3, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (25, 'Title', 'title', 'input', 4, 'no', 4, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (26, 'Biography', 'biography', 'textarea', 4, 'no', 5, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (27, 'Flickr', 'flickr', 'input', 4, 'no', 9, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (28, 'Phone', 'phone', 'input', 4, 'no', 6, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (29, 'Blog', 'blog', 'input', 4, 'no', 7, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (30, 'Twitter', 'twitter', 'input', 4, 'no', 8, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (31, 'Photo', 'photo', 'upload', 4, 'no', 10, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (32, 'Avatar', 'avatar', 'upload', 4, 'no', 11, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (33, 'Birthday', 'birthday', 'date', 4, 'no', 12, 'sidebar', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (34, 'Title', 'title', 'input', 5, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (35, 'Description', 'description', 'textarea', 5, 'no', 1, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (36, 'Title', 'title', 'input', 6, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (37, 'Description', 'description', 'textarea', 6, 'no', 1, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (38, 'Project', 'project', 'input', 7, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (39, 'Description', 'description', 'textarea', 7, 'no', 1, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (40, 'Site', 'site', 'input', 7, 'no', 2, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (41, 'Project Type', 'project-type', 'selectbox_link', 7, 'no', 5, 'sidebar', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (42, 'Industry Sectors', 'industry-sectors', 'selectbox_link', 7, 'no', 6, 'sidebar', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (43, 'Credits', 'credits', 'textarea', 7, 'no', 4, 'sidebar', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (44, 'Site Thumbnail', 'site-thumbnail', 'upload', 7, 'no', 8, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (45, 'Site Launch Date', 'site-launch-date', 'date', 7, 'no', 3, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (46, 'Title', 'title', 'input', 8, 'no', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (47, 'Caption', 'caption', 'textarea', 8, 'no', 1, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (48, 'Description', 'description', 'textarea', 8, 'no', 2, 'sidebar', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (49, 'Photo', 'photo', 'upload', 8, 'no', 3, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (51, 'Title', 'title', 'input', 9, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (52, 'Description', 'description', 'textarea', 9, 'no', 2, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (53, 'Category', 'category', 'select', 9, 'no', 1, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (54, 'Title', 'title', 'input', 10, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (55, 'Body', 'body', 'textarea', 10, 'no', 2, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (56, 'Publish', 'publish', 'checkbox', 10, 'no', 11, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (57, 'Date', 'date', 'date', 10, 'no', 4, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (58, 'Categories', 'categories', 'selectbox_link', 10, 'no', 6, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (59, 'Tags', 'tags', 'taglist', 10, 'no', 9, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (60, 'Author', 'author', 'selectbox_link', 10, 'yes', 3, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (61, 'Home Page Image', 'home-page-image', 'upload', 10, 'no', 8, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (62, 'Title', 'title', 'input', 11, 'no', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (63, 'Author', 'author', 'input', 12, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (64, 'Email', 'email', 'input', 12, 'yes', 1, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (65, 'Website', 'website', 'input', 12, 'no', 2, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (66, 'Date', 'date', 'date', 12, 'no', 3, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (67, 'Article', 'article', 'selectbox_link', 12, 'yes', 4, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (68, 'Comment', 'comment', 'textarea', 12, 'yes', 5, 'sidebar', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (69, 'Article Image', 'article-image', 'upload', 10, 'no', 7, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (70, 'Home Page', 'home-page', 'checkbox', 10, 'no', 12, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (71, 'Email', 'email', 'input', 13, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (72, 'Sign Up Date', 'sign-up-date', 'date', 13, 'no', 1, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (73, 'Subscribe', 'subscribe', 'checkbox', 13, 'no', 2, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (74, 'Name', 'name', 'input', 14, 'yes', 0, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (75, 'Email', 'email', 'input', 14, 'yes', 1, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (76, 'Subject', 'subject', 'input', 14, 'no', 2, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (77, 'Message', 'message', 'textarea', 14, 'yes', 3, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (78, 'Title', 'title', 'input', 15, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (79, 'Images', 'images', 'subsectionmanager', 15, 'no', 4, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (80, 'URL', 'url', 'input', 15, 'no', 1, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (81, 'Description', 'description', 'textarea', 15, 'no', 2, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (82, 'Body', 'body', 'textarea', 15, 'no', 3, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (83, 'Author', 'author', 'selectbox_link', 15, 'yes', 9, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (84, 'Tags', 'tags', 'taglist', 15, 'no', 11, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (85, 'Date', 'date', 'date', 15, 'no', 12, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (86, 'Publish', 'publish', 'checkbox', 15, 'no', 13, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (87, 'Enable Comments', 'enable-comments', 'checkbox', 15, 'no', 14, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (89, 'Title', 'title', 'input', 16, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (90, 'Description', 'description', 'textarea', 16, 'no', 1, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (91, 'Publish', 'publish', 'checkbox', 4, 'no', 13, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (92, 'Custom HTML', 'custom-html', 'checkbox', 15, 'no', 17, 'sidebar', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (93, 'CSS', 'css', 'upload', 15, 'no', 7, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (94, 'JavaScript', 'javascript', 'upload', 15, 'no', 8, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (95, 'File', 'file', 'upload', 16, 'yes', 2, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (96, 'Title', 'title', 'input', 17, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (97, 'Description', 'description', 'textarea', 17, 'no', 1, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (98, 'Parent Topic', 'parent-topic', 'selectbox_link', 17, 'no', 2, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (99, 'Topic', 'topic', 'selectbox_link', 15, 'no', 10, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (100, 'Syntax Highlighting', 'syntax-highlighting', 'checkbox', 15, 'no', 16, 'sidebar', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (101, 'XML', 'xml', 'upload', 15, 'no', 6, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (102, 'Table of Contents', 'table-of-contents', 'checkbox', 15, 'no', 15, 'sidebar', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (103, 'List', 'list', 'input', 18, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (105, 'Item', 'item', 'input', 19, 'no', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (106, 'Open', 'open', 'checkbox', 19, 'no', 4, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (107, 'Order', 'order', 'order_entries', 19, 'no', 3, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (108, 'Member', 'member', 'selectbox_link', 18, 'yes', 1, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (109, 'List', 'list', 'selectbox_link', 19, 'yes', 1, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (110, 'Member', 'member', 'selectbox_link', 19, 'yes', 2, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (112, 'Author', 'author', 'author', 4, 'no', 1, 'sidebar', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (114, 'Title', 'title', 'input', 20, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (115, 'Body', 'body', 'textarea', 20, 'yes', 1, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (116, 'Author', 'author', 'selectbox_link', 20, 'yes', 4, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (117, 'Date', 'date', 'date', 20, 'no', 2, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (118, 'Categories', 'categories', 'selectbox_link', 20, 'no', 5, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (119, 'Tags', 'tags', 'taglist', 20, 'no', 6, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (120, 'Publish', 'publish', 'checkbox', 20, 'no', 7, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (121, 'Comment', 'comment', 'textarea', 21, 'yes', 1, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (122, 'Author', 'author', 'selectbox_link', 21, 'yes', 2, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (123, 'Article', 'article', 'selectbox_link', 21, 'yes', 3, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (124, 'Date', 'date', 'date', 21, 'no', 0, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (125, 'Title', 'title', 'input', 23, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (127, 'URL', 'url', 'input', 23, 'yes', 1, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (129, 'Tags', 'tags', 'taglist', 23, 'no', 2, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (131, 'Note', 'note', 'textarea', 23, 'no', 3, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (135, 'Date', 'date', 'date', 23, 'no', 5, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (137, 'Publish', 'publish', 'checkbox', 23, 'no', 6, 'sidebar', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (141, 'Portfolio', 'portfolio', 'subsectionmanager', 7, 'no', 7, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (143, 'Sort', 'sort', 'order_entries', 4, 'no', 14, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (145, 'Images', 'images', 'subsectionmanager', 10, 'no', 5, 'sidebar', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (147, 'Embed', 'embed', 'textarea', 10, 'no', 13, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (149, 'Email Address', 'email-address', 'memberemail', 1, 'yes', 3, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (150, 'Password', 'password', 'memberpassword', 1, 'yes', 2, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (151, 'Role', 'role', 'memberrole', 1, 'yes', 4, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (152, 'Activation', 'activation', 'memberactivation', 1, 'no', 5, 'sidebar', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (153, 'Timezone', 'timezone', 'membertimezone', 1, 'no', 9, 'sidebar', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (154, 'Created By', 'created-by', 'selectbox_link', 2, 'yes', 1, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (155, 'Last Post', 'last-post', 'selectbox_link', 2, 'yes', 3, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (157, 'Created By', 'created-by', 'selectbox_link', 3, 'yes', 3, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (158, 'Member', 'member', 'selectbox_link', 23, 'yes', 4, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (159, 'Date', 'date', 'date', 14, 'no', 4, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (160, 'Discussion Topic', 'discussion-topic', 'selectbox_link', 25, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (161, 'Subscriber', 'subscriber', 'selectbox_link', 25, 'yes', 1, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (162, 'Subscribe', 'subscribe', 'checkbox', 25, 'no', 2, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (163, 'Emailed', 'emailed', 'date', 20, 'no', 3, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (165, 'File', 'file', 'upload', 15, 'no', 5, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (167, 'Preview', 'preview', 'entry_url', 10, 'no', 10, 'sidebar', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (169, 'Title', 'title', 'input', 27, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (171, 'Body', 'body', 'textarea', 27, 'no', 1, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (173, 'Date', 'date', 'date', 27, 'no', 2, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (175, 'Publish', 'publish', 'checkbox', 27, 'no', 3, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (177, 'Alternate Title', 'alternate-title', 'input', 10, 'no', 1, 'sidebar', 'yes');

-- *** DATA: `tbl_forum_read_discussions` ***
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (1, 1, 2, 1304533927, 4);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (3, 1, 262, 1304439037, 1);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (5, 1, 353, 1309995658, 15);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (7, 1, 289, 1306432178, 23);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (9, 1, 853, 1309995763, 4);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (11, 1, 264, 1304440282, 1);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (13, 1, 258, 1304440330, 3);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (15, 1, 260, 1304622478, 2);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (17, 1, 309, 1304440344, 4);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (19, 1, 359, 1304440350, 2);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (21, 1, 793, 1304622494, 3);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (23, 1, 833, 1304441832, 1);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (25, 1, 869, 1313181844, 11);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (27, 33, 853, 1304484654, 4);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (29, 11, 289, 1304488163, 18);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (31, 59, 793, 1305825031, 3);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (33, 59, 258, 1304549645, 3);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (35, 59, 2, 1304549656, 4);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (37, 59, 901, 1319489980, 1);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (39, 7, 289, 1304550576, 19);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (41, 7, 353, 1304550620, 10);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (43, 72, 289, 1304553023, 19);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (45, 7, 901, 1304554045, 1);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (47, 1, 901, 1304707240, 1);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (49, 70, 853, 1304699990, 4);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (51, 59, 833, 1319491652, 1);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (53, 237, 289, 1304609945, 19);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (55, 13, 289, 1304610304, 19);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (57, 13, 869, 1304610316, 2);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (59, 37, 901, 1304633740, 1);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (61, 685, 901, 1304613204, 1);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (63, 235, 869, 1304613750, 2);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (65, 235, 353, 1319214678, 15);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (67, 235, 289, 1304613953, 19);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (69, 235, 901, 1304613871, 1);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (71, 235, 309, 1304613901, 4);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (73, 235, 793, 1304613940, 3);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (75, 685, 869, 1304979918, 6);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (77, 237, 853, 1304622722, 4);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (79, 37, 289, 1306776565, 23);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (81, 68, 289, 1304717448, 21);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (83, 236, 289, 1304963020, 22);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (85, 993, 289, 1310567754, 23);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (87, 37, 869, 1305131975, 10);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (89, 993, 869, 1309885120, 11);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (91, 993, 359, 1305307189, 2);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (93, 993, 309, 1305307198, 4);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (95, 993, 2, 1305307294, 4);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (97, 993, 262, 1305307319, 1);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (99, 993, 260, 1305307337, 2);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (101, 993, 853, 1310567935, 4);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (103, 239, 289, 1305315924, 23);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (105, 59, 353, 1305828218, 15);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (107, 59, 289, 1305825023, 23);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (109, 70, 869, 1305827867, 11);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (111, 993, 353, 1306361243, 15);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (113, 238, 901, 1307718102, 1);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (115, 238, 260, 1307718115, 2);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (117, 238, 309, 1307036201, 4);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (119, 238, 853, 1307036208, 4);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (121, 238, 353, 1310492594, 15);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (123, 33, 353, 1307565218, 15);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (125, 305, 353, 1307657552, 15);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (127, 305, 833, 1307657571, 1);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (129, 238, 869, 1307718095, 11);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (131, 238, 264, 1307718150, 1);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (133, 1, 1297, 1308095509, 6);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (135, 236, 1297, 1307985547, 1);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (137, 65, 869, 1318476942, 11);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (139, 15, 869, 1309218729, 11);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (141, 7, 1297, 1309467189, 6);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (143, 993, 1297, 1310567798, 6);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (145, 53, 289, 1309984198, 23);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (147, 1279, 869, 1314204161, 11);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (149, 1629, 901, 1312388234, 1);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (151, 1629, 309, 1312930519, 4);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (153, 1629, 289, 1312388298, 23);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (155, 1629, 869, 1312390365, 11);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (157, 1567, 869, 1312997027, 11);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (159, 1663, 353, 1313182400, 15);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (161, 1663, 359, 1313457041, 2);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (163, 1663, 258, 1313457021, 3);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (165, 1663, 260, 1313457033, 2);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (167, 1663, 793, 1313457071, 3);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (169, 1663, 901, 1313457078, 1);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (171, 1663, 289, 1313457210, 23);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (173, 993, 793, 1313798596, 3);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (175, 53, 869, 1314988765, 11);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (177, 1, 1829, 1315853023, 1);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (179, 234, 1829, 1315856716, 1);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (181, 15, 793, 1317244938, 3);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (183, 59, 2077, 1319490522, 1);
INSERT INTO `tbl_forum_read_discussions` (`id`, `member_id`, `discussion_id`, `last_viewed`, `comments`) VALUES (185, 65, 2077, 1319493376, 2);

-- *** DATA: `tbl_members_roles` ***
INSERT INTO `tbl_members_roles` (`id`, `name`, `handle`) VALUES (1, 'Public', 'public');
INSERT INTO `tbl_members_roles` (`id`, `name`, `handle`) VALUES (2, 'Inactive', 'inactive');
INSERT INTO `tbl_members_roles` (`id`, `name`, `handle`) VALUES (3, 'Member', 'member');
INSERT INTO `tbl_members_roles` (`id`, `name`, `handle`) VALUES (4, 'Administrator', 'administrator');

-- *** DATA: `tbl_members_roles_event_permissions` ***
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (61, 2, 'save_item', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (60, 2, 'save_item', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (59, 2, 'save_article_comment', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (58, 2, 'save_article_comment', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (57, 2, 'add_to_mailing_list', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (56, 2, 'add_to_mailing_list', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (499, 3, 'save_article_comment', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (497, 3, 'publish_article', 'edit', 2);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (495, 3, 'publish_article', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (493, 3, 'openid_logout', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (491, 3, 'openid_logout', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (489, 3, 'openid_data', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (487, 3, 'openid_data', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (485, 3, 'openid_auth', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (483, 3, 'openid_auth', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (34, 1, 'add_to_mailing_list', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (35, 1, 'add_to_mailing_list', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (36, 1, 'save_article_comment', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (37, 1, 'save_article_comment', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (38, 1, 'save_item', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (39, 1, 'save_item', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (40, 1, 'save_items', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (41, 1, 'save_items', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (42, 1, 'save_link', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (43, 1, 'save_link', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (44, 1, 'save_list', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (45, 1, 'save_list', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (46, 1, 'save_lists', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (47, 1, 'save_lists', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (48, 1, 'save_news', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (49, 1, 'save_news', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (50, 1, 'save_note', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (51, 1, 'save_note', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (52, 1, 'save_resource', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (53, 1, 'save_resource', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (54, 1, 'save_topic', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (55, 1, 'save_topic', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (62, 2, 'save_items', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (63, 2, 'save_items', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (64, 2, 'save_link', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (65, 2, 'save_link', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (66, 2, 'save_list', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (67, 2, 'save_list', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (68, 2, 'save_lists', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (69, 2, 'save_lists', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (70, 2, 'save_news', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (71, 2, 'save_news', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (72, 2, 'save_note', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (73, 2, 'save_note', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (74, 2, 'save_resource', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (75, 2, 'save_resource', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (76, 2, 'save_topic', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (77, 2, 'save_topic', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (78, 4, 'add_to_mailing_list', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (79, 4, 'add_to_mailing_list', 'edit', 2);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (80, 4, 'save_article_comment', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (81, 4, 'save_article_comment', 'edit', 2);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (82, 4, 'save_item', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (83, 4, 'save_item', 'edit', 2);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (84, 4, 'save_items', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (85, 4, 'save_items', 'edit', 2);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (86, 4, 'save_link', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (87, 4, 'save_link', 'edit', 2);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (88, 4, 'save_list', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (89, 4, 'save_list', 'edit', 2);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (90, 4, 'save_lists', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (91, 4, 'save_lists', 'edit', 2);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (92, 4, 'save_news', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (93, 4, 'save_news', 'edit', 2);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (94, 4, 'save_note', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (95, 4, 'save_note', 'edit', 2);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (96, 4, 'save_resource', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (97, 4, 'save_resource', 'edit', 2);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (98, 4, 'save_topic', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (99, 4, 'save_topic', 'edit', 2);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (481, 3, 'members_update_password', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (479, 3, 'members_update_password', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (477, 3, 'members_reset_password', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (475, 3, 'members_reset_password', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (473, 3, 'members_register', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (471, 3, 'members_register', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (469, 3, 'members_regenerate_activation_code', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (467, 3, 'members_regenerate_activation_code', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (465, 3, 'members_generate_recovery_code', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (463, 3, 'members_generate_recovery_code', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (461, 3, 'members_activate_account', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (459, 3, 'members_activate_account', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (457, 3, 'forum_utilities', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (455, 3, 'forum_utilities', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (453, 3, 'forum_post', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (451, 3, 'forum_post', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (449, 3, 'forum_notifications', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (447, 3, 'forum_notifications', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (445, 3, 'forum_new_discussion', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (443, 3, 'forum_new_discussion', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (441, 3, 'forum_new_comment', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (439, 3, 'forum_new_comment', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (437, 3, 'forum_edit_discussion', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (435, 3, 'forum_edit_discussion', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (433, 3, 'forum_edit_comment', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (431, 3, 'forum_edit_comment', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (429, 3, 'email_news_post', 'edit', 2);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (427, 3, 'email_news_post', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (425, 3, 'email_account_activation', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (423, 3, 'email_account_activation', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (421, 3, 'edit_member', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (419, 3, 'edit_member', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (417, 3, 'dynamic_event_redirect', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (415, 3, 'dynamic_event_redirect', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (413, 3, 'download_file', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (411, 3, 'download_file', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (409, 3, 'author_login', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (407, 3, 'author_login', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (405, 3, 'add_to_mailing_list', 'edit', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (403, 3, 'add_to_mailing_list', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (501, 3, 'save_article_comment', 'edit', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (503, 3, 'save_item', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (505, 3, 'save_item', 'edit', 2);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (507, 3, 'save_items', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (509, 3, 'save_items', 'edit', 2);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (511, 3, 'save_link', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (513, 3, 'save_link', 'edit', 2);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (515, 3, 'save_list', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (517, 3, 'save_list', 'edit', 2);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (519, 3, 'save_lists', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (521, 3, 'save_lists', 'edit', 2);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (523, 3, 'save_news', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (525, 3, 'save_news', 'edit', 2);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (527, 3, 'save_note', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (529, 3, 'save_note', 'edit', 2);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (531, 3, 'save_resource', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (533, 3, 'save_resource', 'edit', 2);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (535, 3, 'save_topic', 'create', 1);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (537, 3, 'save_topic', 'edit', 2);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (539, 3, 'send_message', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (541, 3, 'send_message', 'edit', 2);

-- *** DATA: `tbl_members_roles_forbidden_pages` ***

-- *** DATA: `tbl_pages` ***
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (1, NULL, 'Forum', 'forum', NULL, 'dpage', 'forum_discussions,forum_read_discussions,member_details,member_info,member_navigation', 'author_login,forum_utilities', 15);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (2, 1, 'Filter', 'forum-filter', 'forum', 'dpage', 'forum_discussions_filtered,forum_read_discussions,member_info,member_navigation', 'forum_utilities', 10);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (3, 1, 'Discussions', 'discussions', 'forum', 'discussion-id/cpage', 'forum_comments,forum_discussion_subscriber,forum_discussion_subscribers,forum_discussions,forum_members,forum_subscription_members,member_info,member_navigation', 'author_login,forum_post,forum_utilities', 11);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (4, 3, 'New Discussion', 'new', 'forum/discussions', NULL, 'member_info,member_navigation', 'forum_post,forum_utilities', 12);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (5, 3, 'Edit Discussion', 'edit-discussion', 'forum/discussions', 'discussion-id', 'forum_discussions,forum_edit_discussion_comment,member_info,member_navigation', 'forum_post', 13);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (6, 3, 'Edit Comment', 'edit-comment', 'forum/discussions', 'comment-id/cpage/position', 'forum_edit_comment,member_info,member_navigation', 'forum_post', 14);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (7, 1, 'Code Source', 'code-source', 'forum', 'comment-id/position', 'forum_code_source', NULL, 15);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (8, NULL, 'Members', 'members', NULL, 'member', 'member_info,member_navigation,member_username', NULL, 20);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (9, 8, 'New', 'new', 'members', NULL, 'location,member_info,member_navigation,timezones', 'members_register', 26);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (10, 8, 'Edit', 'edit', 'members', NULL, 'location,member_info,member_navigation,timezones', 'edit_member', 27);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (11, 8, 'Activate', 'activate', 'members', 'code/email', 'member_info,member_navigation', 'members_activate_account,members_regenerate_activation_code', 28);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (12, 8, 'Reset Password', 'reset-pass', 'members', 'mode/email', 'member_info,member_navigation', 'members_generate_recovery_code,members_reset_password', 29);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (13, 8, 'Change Password', 'change-pass', 'members', NULL, 'member_info,member_navigation', 'members_update_password', 30);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (14, NULL, 'Forbidden', 'forbidden', NULL, NULL, 'navigation', NULL, 8);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (15, NULL, 'Page Not Found', 'page-not-found', NULL, NULL, 'navigation', NULL, 9);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (16, NULL, 'Dashboard', 'dashboard', NULL, 'action/list/item', 'author_details,dashboard,links_list,lists,member_details,member_info,member_navigation,news_archive,news_categories,news_tags,news_topics,topics', 'author_login', 12);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (17, NULL, 'Home', 'home', NULL, NULL, 'articles_home,articles_latest,flickr,latest_work,navigation,twitter', 'add_to_mailing_list', 1);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (18, NULL, 'Team', 'team', NULL, 'team-member', 'articles_team,flickr,latest_articles,member,navigation,team_profile,team_snapshot,twitter,twitter_team', 'add_to_mailing_list', 3);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (19, NULL, 'Projects', 'projects', NULL, 'project', 'industry_sectors,navigation,project_types,work,work_project', 'add_to_mailing_list', 2);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (20, NULL, 'About', 'about', NULL, NULL, 'navigation,services', 'add_to_mailing_list', 5);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (21, NULL, 'Blog', 'blog', NULL, 'article/category/page', 'article_avatars,article_comments,articles,articles_by_category,articles_pages,categories,flickr_thumbnails,navigation,twitter', 'add_to_mailing_list,save_article_comment', 4);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (22, NULL, 'Contact', 'contact', NULL, NULL, 'navigation', 'add_to_mailing_list,send_message', 6);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (23, 19, 'Project', 'project', 'projects', 'type', 'industry_sectors,navigation,project_types,work_by_type', 'add_to_mailing_list', 35);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (24, 19, 'Industry', 'industry', 'projects', 'sector', 'industry_sectors,navigation,project_types,work_by_industry', 'add_to_mailing_list', 36);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (25, NULL, 'Login', 'login', NULL, NULL, 'member_info,member_navigation', NULL, 19);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (26, NULL, 'Resources', 'resources', NULL, 'a/b/c', 'author_details,images,member_info,member_navigation,resource,resource_by_id,resource_latest,resources,resources_by_date,topics', 'author_login,download_file,save_resource', 16);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (27, NULL, 'News', 'news', NULL, 'article/category/page', 'author_details,member_info,member_navigation,news_archive,news_article,news_article_avatars,news_by_category,news_by_id,news_categories,news_comments,news_latest,news_pages,news_tags,news_topics,topics', 'author_login,email_news_post,save_news,save_note', 13);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (28, NULL, 'People', 'people', NULL, 'team-member', 'articles_team,latest_articles,member,member_info,member_navigation,people,team_profile,twitter,twitter_team', 'author_login', 14);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (29, NULL, 'Maintenance', 'maintenance', NULL, NULL, NULL, NULL, 10);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (30, NULL, 'Lists', 'lists', NULL, 'action/list/item', 'items,lists,member_details,member_info,member_navigation', 'author_login,save_item,save_items,save_list,save_lists', 18);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (31, 26, 'Resources by Tag', 'tag', 'resources', 'tag', 'member_info,member_navigation,resources,resources_by_tag,topics', 'save_resource', 17);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (32, 26, 'Resources by Topic', 'topic', 'resources', 'topic', 'member_info,member_navigation,resources,resources_by_topic,topics', 'author_login', 18);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (33, 26, 'Updated', 'updated', 'resources', 'year/month', 'member_info,member_navigation,resources_by_date', 'author_login', 19);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (34, 27, 'Archive', 'archive', 'news', 'year/month', 'member_info,member_navigation,news_archive,news_by_date,news_tags,news_topics', 'author_login', 6);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (35, 26, 'Topics', 'topics', 'resources', 'entry/action/result', 'author_details,member_info,member_navigation,topic_by_id,topic_latest,topics', 'author_login,save_topic', 20);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (37, NULL, 'Links', 'links', NULL, 'a/b/c', 'author_details,link,link_by_id,link_latest,links,member_info,member_names,member_navigation', 'author_login,save_link', 17);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (39, 37, 'Links by Tag', 'tag', 'links', 'tag', 'links,links_by_tag,member_info,member_navigation', 'author_login', 22);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (41, 27, 'News by Tag', 'tag', 'news', 'tag', 'member_info,member_navigation,news_archive,news_by_tag,news_tags,news_topics', 'author_login', 7);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (43, NULL, 'OpenID', 'openid', NULL, NULL, 'member_navigation', 'author_login', 21);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (45, NULL, 'RSS', 'rss', NULL, NULL, 'rss_articles', NULL, 11);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (47, 21, 'Drafts', 'drafts', 'blog', 'article/category/page', 'article_avatars,articles_by_category,articles_drafts,articles_pages,categories,flickr_thumbnails,navigation,twitter', 'publish_article', 39);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (49, NULL, 'Jobs', 'jobs', NULL, 'article/category/page', 'categories,flickr_thumbnails,jobs,navigation,twitter', NULL, 7);

-- *** DATA: `tbl_pages_types` ***
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (305, 7, 'text');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (318, 14, 403);
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (319, 15, 404);
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (324, 26, 'member');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (56, 18, 'main');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (309, 21, 'main');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (315, 19, 'main');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (314, 20, 'main');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (61, 22, 'main');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (320, 16, 'member');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (321, 27, 'member');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (322, 28, 'member');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (323, 1, 'member');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (99, 29, 'hidden');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (101, 29, 'maintenance');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (328, 31, 'member');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (329, 32, 'member');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (331, 33, 'member');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (326, 34, 'member');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (330, 35, 'member');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (325, 37, 'member');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (332, 39, 'member');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (327, 41, 'member');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (235, 45, 'XML');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (233, 45, 'hidden');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (316, 17, 'index');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (311, 47, 'admin');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (317, 17, 'main');

-- *** DATA: `tbl_sections` ***
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`, `filterable`) VALUES (1, 'Members', 'members', 12, 1, 'asc', 'no', 'Forum', 'yes');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`, `filterable`) VALUES (2, 'Discussions', 'discussions', 13, NULL, 'asc', 'no', 'Forum', 'yes');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`, `filterable`) VALUES (3, 'Comments', 'comments', 14, NULL, 'asc', 'no', 'Forum', 'yes');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`, `filterable`) VALUES (4, 'Team', 'team', 1, 143, 'asc', 'no', 'Site', 'yes');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`, `filterable`) VALUES (5, 'Project Types', 'project-types', 9, NULL, 'asc', 'no', 'Meta', 'yes');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`, `filterable`) VALUES (6, 'Industry Sectors', 'industry-sectors', 10, 36, 'asc', 'no', 'Meta', 'yes');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`, `filterable`) VALUES (7, 'Work', 'work', 2, 45, 'desc', 'no', 'Site', 'yes');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`, `filterable`) VALUES (8, 'Portfolio', 'portfolio', 3, 46, 'asc', 'no', 'Site', 'yes');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`, `filterable`) VALUES (9, 'Services', 'services', 4, NULL, 'asc', 'no', 'Site', 'yes');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`, `filterable`) VALUES (10, 'Articles', 'articles', 5, 57, 'desc', 'no', 'Site', 'yes');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`, `filterable`) VALUES (11, 'Categories', 'categories', 11, NULL, 'asc', 'no', 'Meta', 'yes');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`, `filterable`) VALUES (12, 'Article Comments', 'article-comments', 6, NULL, 'asc', 'no', 'Messages', 'yes');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`, `filterable`) VALUES (13, 'Mailing List', 'mailing-list', 7, NULL, 'asc', 'no', 'Messages', 'yes');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`, `filterable`) VALUES (14, 'Contact Form', 'contact-form', 8, 159, 'desc', 'no', 'Messages', 'yes');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`, `filterable`) VALUES (15, 'Resources', 'resources', 17, NULL, 'asc', 'no', 'Content', 'yes');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`, `filterable`) VALUES (16, 'Images', 'images', 20, NULL, 'asc', 'no', 'Content', 'yes');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`, `filterable`) VALUES (17, 'Topics', 'topics', 21, NULL, 'asc', 'no', 'Content', 'yes');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`, `filterable`) VALUES (18, 'Lists', 'lists', 22, NULL, 'asc', 'no', 'Content', 'yes');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`, `filterable`) VALUES (19, 'Items', 'items', 23, NULL, 'asc', 'no', 'Content', 'yes');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`, `filterable`) VALUES (20, 'News', 'news', 16, NULL, 'asc', 'no', 'Content', 'yes');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`, `filterable`) VALUES (21, 'Notes', 'notes', 19, NULL, 'asc', 'no', 'Content', 'yes');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`, `filterable`) VALUES (23, 'Links', 'links', 18, NULL, 'asc', 'no', 'Content', 'yes');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`, `filterable`) VALUES (25, 'Notifications', 'notifications', 15, NULL, 'asc', 'no', 'Forum', 'yes');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`, `filterable`) VALUES (27, 'Jobs', 'jobs', 24, NULL, 'asc', 'no', 'Site', 'yes');

-- *** DATA: `tbl_sections_association` ***
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (353, 2, 10, 3, 18, 'no');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (347, 1, 1, 4, 22, 'yes');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (223, 5, 34, 7, 41, 'no');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (225, 6, 36, 7, 42, 'no');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (103, 10, 54, 12, 67, 'no');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (473, 11, 62, 10, 58, 'no');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (469, 1, 1, 10, 60, 'yes');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (435, 1, 1, 15, 83, 'yes');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (123, 17, 96, 17, 98, 'no');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (437, 17, 96, 15, 99, 'no');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (363, 1, 1, 18, 108, 'yes');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (364, 18, 103, 19, 109, 'no');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (365, 1, 1, 19, 110, 'yes');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (379, 1, 1, 20, 116, 'yes');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (381, 17, 96, 20, 118, 'no');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (361, 1, 1, 21, 122, 'yes');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (362, 20, 114, 21, 123, 'no');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (433, 15, 79, 16, 79, 'yes');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (276, 7, 141, 8, 141, 'yes');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (471, 10, 145, 16, 145, 'yes');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (351, 1, 148, 2, 154, 'yes');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (352, 1, 148, 2, 155, 'yes');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (354, 1, 148, 3, 157, 'yes');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (366, 1, 148, 23, 158, 'yes');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (377, 1, 1, 25, 161, 'yes');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (375, 2, 10, 25, 160, 'yes');
