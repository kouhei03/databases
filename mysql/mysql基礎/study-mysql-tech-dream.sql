/*レンタルサーバーとAWS light-sailで稼働しているwordpress*/

/*データベースの作成*/
create database wordpress1;

/* wordpres1 データベースを選択*/
/* show tables;でテーブルを表示*/

use wordpress1;
show tables;

/*wordpres1 データベースの各テーブルを表示*/
select * from wp_asq_answers;
select * from wp_asq_questions;
select * from wp_asq_quizzes;
select * from wp_asq_result_templates;
select * from wp_blc_filters;
select * from wp_blc_instances;
select * from wp_blc_links;
select * from wp_blc_synch;
select * from wp_cbnetpo_ping_optimizer;
select * from wp_commentmeta;
select * from wp_comments;
select * from wp_ewwwio_images;
select * from wp_ewwwio_queue;
select * from wp_kjk_balloon_creator;
select * from wp_links;
select * from wp_nextend2_image_storage;
select * from wp_nextend2_section_storage;
select * from wp_nextend2_smartslider3_generators;
select * from wp_nextend2_smartslider3_sliders;
select * from wp_nextend2_smartslider3_sliders_xref;
select * from wp_nextend2_smartslider3_slides;
select * from wp_odb_logs;
select * from wp_options;
select * from wp_postmeta;
select * from wp_posts;
select * from wp_redirection_404;
select * from wp_redirection_groups;
select * from wp_redirection_items;
select * from wp_redirection_logs;
select * from wp_siteguard_history;
select * from wp_siteguard_login;
select * from wp_term_relationships;
select * from wp_term_taxonomy;
select * from wp_termmeta;
select * from wp_terms;
select * from wp_usermeta;
select * from wp_users;
select * from wp_yydev_tagmanager;
