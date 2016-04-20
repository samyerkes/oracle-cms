/* DROP TABLES */
DROP TABLE settings_general;
DROP TABLE settings_security;
DROP TABLE settings_privacy;
DROP TABLE settings;
DROP TABLE visits;
DROP TABLE contents;
DROP TABLE pages;
DROP TABLE users_websites;
DROP TABLE websites;
DROP TABLE themes;
DROP TABLE users;
DROP TABLE roles_privileges;
DROP TABLE roles;
DROP TABLE privileges;
/* DROP SEQUENCES */
DROP SEQUENCE privileges_sequence;
DROP SEQUENCE roles_sequence;
DROP SEQUENCE users_sequence;
DROP SEQUENCE themes_sequence;
DROP SEQUENCE websites_sequence;
DROP SEQUENCE pages_sequence;
DROP SEQUENCE settings_sequence;

/* Create the privileges table */
CREATE table privileges (privilege_id int primary key not null, privilege_name varchar(50) not null, privilege_description varchar(50) not null);
CREATE SEQUENCE privileges_sequence START WITH 1 INCREMENT BY 1;
INSERT INTO privileges VALUES (privileges_sequence.nextval, 'Remove Co-Admin', 'Delete Co-Admin user');
INSERT INTO privileges VALUES (privileges_sequence.nextval, 'Remove Global Moderator', 'Delete Global Moderator User');
INSERT INTO privileges VALUES (privileges_sequence.nextval, 'Remove Moderator', 'Delete Moderator User');
INSERT INTO privileges VALUES (privileges_sequence.nextval, 'Remove Author', 'Delete Author User');
INSERT INTO privileges VALUES (privileges_sequence.nextval, 'Assign Roles', 'Assign Roles to Users');
INSERT INTO privileges VALUES (privileges_sequence.nextval, 'Monitor Global Moderator', 'Watch over Global Moderator');
INSERT INTO privileges VALUES (privileges_sequence.nextval, 'Monitor Moderator', 'Watch over Moderator');
INSERT INTO privileges VALUES (privileges_sequence.nextval, 'Monitor Author', 'Watch over Author');
INSERT INTO privileges VALUES (privileges_sequence.nextval, 'Create Post', 'Creating a post in any page in assigned website');
INSERT INTO privileges VALUES (privileges_sequence.nextval, 'Edit Post', 'Editing a post in any page in assigned website');
INSERT INTO privileges VALUES (privileges_sequence.nextval, 'Delete Post', 'Deleting a post in any page in assigned website');
INSERT INTO privileges VALUES (privileges_sequence.nextval, 'Edit Any Post', 'Editing a post in any page');
INSERT INTO privileges VALUES (privileges_sequence.nextval, 'Delete Any Post', 'Deleting a post in any page');

/* Create the roles table */
CREATE table roles (role_id int primary key not null, role_name varchar(25) not null);
CREATE SEQUENCE roles_sequence START WITH 1 INCREMENT BY 1;
INSERT INTO roles VALUES (roles_sequence.nextval, 'Admin');
INSERT INTO roles VALUES (roles_sequence.nextval, 'Co-Admin');
INSERT INTO roles VALUES (roles_sequence.nextval, 'Global Moderator');
INSERT INTO roles VALUES (roles_sequence.nextval, 'Moderator');
INSERT INTO roles VALUES (roles_sequence.nextval, 'Author');

/* Create the roles_privileges table */
CREATE table roles_privileges (role_id int references roles(role_id) not null, privilege_id int references privileges(privilege_id) not null, primary key (role_id, privilege_id));
INSERT INTO roles_privileges VALUES (1, 1);
INSERT INTO roles_privileges VALUES (1, 2);
INSERT INTO roles_privileges VALUES (1, 3);
INSERT INTO roles_privileges VALUES (1, 4);
INSERT INTO roles_privileges VALUES (1, 5);
INSERT INTO roles_privileges VALUES (1, 6);
INSERT INTO roles_privileges VALUES (1, 7);
INSERT INTO roles_privileges VALUES (1, 8);
INSERT INTO roles_privileges VALUES (1, 12);
INSERT INTO roles_privileges VALUES (1, 13);
INSERT INTO roles_privileges VALUES (2, 2);
INSERT INTO roles_privileges VALUES (2, 3);
INSERT INTO roles_privileges VALUES (2, 4);
INSERT INTO roles_privileges VALUES (2, 5);
INSERT INTO roles_privileges VALUES (2, 6);
INSERT INTO roles_privileges VALUES (2, 7);
INSERT INTO roles_privileges VALUES (2, 8);
INSERT INTO roles_privileges VALUES (2, 12);
INSERT INTO roles_privileges VALUES (2, 13);
INSERT INTO roles_privileges VALUES (3, 3);
INSERT INTO roles_privileges VALUES (3, 4);
INSERT INTO roles_privileges VALUES (3, 7);
INSERT INTO roles_privileges VALUES (3, 8);
INSERT INTO roles_privileges VALUES (3, 12);
INSERT INTO roles_privileges VALUES (3, 13);
INSERT INTO roles_privileges VALUES (4, 4);
INSERT INTO roles_privileges VALUES (4, 8);
INSERT INTO roles_privileges VALUES (4, 10);
INSERT INTO roles_privileges VALUES (4, 11);
INSERT INTO roles_privileges VALUES (5, 9);
INSERT INTO roles_privileges VALUES (5, 10);
INSERT INTO roles_privileges VALUES (5, 11);

/* Create the users table */
CREATE table users (user_id int primary key not null, user_name varchar(25) not null unique, user_password varchar(25) not null, user_fname varchar(25) not null, user_lname varchar(25) not null, user_last_login timestamp not null, role_id int references roles(role_id));
CREATE SEQUENCE users_sequence START WITH 1 INCREMENT BY 1; 
INSERT INTO users VALUES (users_sequence.nextval, 'rusty22', 'magni', 'Kelsi', 'OReilly', TO_TIMESTAMP('03/19/2016 03:50:50', 'MM/DD/YYYY HH24:MI:SS'), 0); 
INSERT INTO users VALUES (users_sequence.nextval, 'mckayla58', 'quia', 'Barry', 'Okuneva', TO_TIMESTAMP('04/13/2016 21:18:06', 'MM/DD/YYYY HH24:MI:SS'), 4); 
INSERT INTO users VALUES (users_sequence.nextval, 'schuster.jovani', 'fuga', 'Dayna', 'Gulgowski', TO_TIMESTAMP('04/14/2016 15:50:12', 'MM/DD/YYYY HH24:MI:SS'), 1); 
INSERT INTO users VALUES (users_sequence.nextval, 'jeanne.trantow', 'qui', 'Kasey', 'Lueilwitz', TO_TIMESTAMP('03/21/2016 01:58:18', 'MM/DD/YYYY HH24:MI:SS'), 1); 
INSERT INTO users VALUES (users_sequence.nextval, 'lonnie86', 'aut', 'Reynold', 'Padberg', TO_TIMESTAMP('03/30/2016 17:13:41', 'MM/DD/YYYY HH24:MI:SS'), 2); 
INSERT INTO users VALUES (users_sequence.nextval, 'rerdman', 'deserunt', 'Marjolaine', 'Torp', TO_TIMESTAMP('04/01/2016 13:04:30', 'MM/DD/YYYY HH24:MI:SS'), 1); 
INSERT INTO users VALUES (users_sequence.nextval, 'flavio05', 'in', 'Noemi', 'Carroll', TO_TIMESTAMP('04/12/2016 00:50:37', 'MM/DD/YYYY HH24:MI:SS'), 2); 
INSERT INTO users VALUES (users_sequence.nextval, 'zhuel', 'assumenda', 'Ladarius', 'Torphy', TO_TIMESTAMP('04/12/2016 22:04:59', 'MM/DD/YYYY HH24:MI:SS'), 1); 
INSERT INTO users VALUES (users_sequence.nextval, 'kautzer.elbert', 'saepe', 'Osbaldo', 'Feil', TO_TIMESTAMP('04/04/2016 22:13:08', 'MM/DD/YYYY HH24:MI:SS'), 0); 
INSERT INTO users VALUES (users_sequence.nextval, 'dkertzmann', 'quod', 'Concepcion', 'Schuppe', TO_TIMESTAMP('04/16/2016 17:02:40', 'MM/DD/YYYY HH24:MI:SS'), 3); 

/* Create the themes table */
CREATE table themes (theme_id int primary key not null, theme_name varchar(100) not null, theme_description varchar(200) not null);
CREATE SEQUENCE themes_sequence START WITH 1 INCREMENT BY 1;
INSERT INTO themes VALUES (themes_sequence.nextval, 'Simple', 'Simple single colored'); 
INSERT INTO themes VALUES (themes_sequence.nextval, 'New Years', 'Festive celebratory New Year'); 
INSERT INTO themes VALUES (themes_sequence.nextval, 'Valentines', 'Cute lovey dovey Valentine'); 
INSERT INTO themes VALUES (themes_sequence.nextval, 'St. Partrick', 'Drink Up Green Irish St. Patricks'); 
INSERT INTO themes VALUES (themes_sequence.nextval, 'Easter', 'Baby duck and bunny Easter'); 
INSERT INTO themes VALUES (themes_sequence.nextval, 'July 4th', 'Red White and Blue colored'); 
INSERT INTO themes VALUES (themes_sequence.nextval, 'Thanksgiving', 'Autumn, pumkins and turkey'); 
INSERT INTO themes VALUES (themes_sequence.nextval, 'Halloween', 'Ghost, witches and spiderwebs'); 
INSERT INTO themes VALUES (themes_sequence.nextval, 'Christmas', 'Red and green Christmas celebration'); 
INSERT INTO themes VALUES (themes_sequence.nextval, 'Unicorn Fantasy', 'Majestic unicorn running across a rainbow'); 

/* Create the websites table */
CREATE table websites (website_id int primary key not null, website_address varchar(50) not null, website_type varchar(25) not null, theme_id int references themes(theme_id) not null);
CREATE SEQUENCE websites_sequence START WITH 1 INCREMENT BY 1;
INSERT INTO websites VALUES (websites_sequence.nextval, 'leannon.com', 'Satire', 3); 
INSERT INTO websites VALUES (websites_sequence.nextval, 'gorczany.info', 'Social Media', 2); 
INSERT INTO websites VALUES (websites_sequence.nextval, 'simonis.com', 'Informational', 2); 

/* Create the users_websites table */
CREATE table users_websites (user_id int references users(user_id) not null, website_id int references websites(website_id) not null, primary key (user_id, website_id));
INSERT INTO users_websites VALUES (9, 1); 
INSERT INTO users_websites VALUES (8, 2); 
INSERT INTO users_websites VALUES (6, 3); 
INSERT INTO users_websites VALUES (2, 2); 
INSERT INTO users_websites VALUES (10, 2); 
INSERT INTO users_websites VALUES (1, 1); 
INSERT INTO users_websites VALUES (6, 2); 
INSERT INTO users_websites VALUES (4, 1); 
INSERT INTO users_websites VALUES (5, 2); 
INSERT INTO users_websites VALUES (8, 3); 
INSERT INTO users_websites VALUES (3, 1);
INSERT INTO users_websites VALUES (7, 2); 

/* Create the pages table */
CREATE table pages (page_id int primary key not null, website_id int references websites(website_id) not null, page_name varchar(100) not null, page_order int not null, page_parent int, page_last_revised timestamp not null); 
CREATE SEQUENCE pages_sequence START WITH 1 INCREMENT BY 1; 
INSERT INTO pages VALUES (pages_sequence.nextval, 1, 'Custom Furniture', 1, 0, TO_TIMESTAMP('03/28/2016 21:52:06', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO pages VALUES (pages_sequence.nextval, 1, 'About us', 1, 1, TO_TIMESTAMP('04/04/2016 15:18:47', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO pages VALUES (pages_sequence.nextval, 1, 'Our mission', 1, 2, TO_TIMESTAMP('03/22/2016 22:47:09', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO pages VALUES (pages_sequence.nextval, 1, 'News', 2, 1, TO_TIMESTAMP('03/28/2016 22:42:05', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO pages VALUES (pages_sequence.nextval, 1, 'Ordering', 3, 1, TO_TIMESTAMP('03/20/2016 12:54:21', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO pages VALUES (pages_sequence.nextval, 1, 'Shipping notices', 1, 5, TO_TIMESTAMP('03/27/2016 20:07:51', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO pages VALUES (pages_sequence.nextval, 1, 'Shipping returns', 2, 5, TO_TIMESTAMP('03/27/2016 20:07:51', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO pages VALUES (pages_sequence.nextval, 1, 'Shipping FAQs', 3, 5, TO_TIMESTAMP('03/27/2016 20:07:51', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO pages VALUES (pages_sequence.nextval, 2, 'Virginia Tourism', 2, 0, TO_TIMESTAMP('03/28/2016 21:10:15', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO pages VALUES (pages_sequence.nextval, 2, 'Eating', 1, 9, TO_TIMESTAMP('04/08/2016 10:43:51', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO pages VALUES (pages_sequence.nextval, 2, 'Fine dining', 1, 10, TO_TIMESTAMP('03/30/2016 09:57:36', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO pages VALUES (pages_sequence.nextval, 2, 'Food trucks', 2, 10, TO_TIMESTAMP('04/07/2016 06:12:20', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO pages VALUES (pages_sequence.nextval, 2, 'Shopping', 2, 9, TO_TIMESTAMP('03/27/2016 20:07:51', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO pages VALUES (pages_sequence.nextval, 2, 'Shopping malls', 1, 13, TO_TIMESTAMP('03/28/2016 21:10:15', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO pages VALUES (pages_sequence.nextval, 2, 'Outlet factories', 2, 13, TO_TIMESTAMP('04/08/2016 10:43:51', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO pages VALUES (pages_sequence.nextval, 2, 'Recreation', 3, 9, TO_TIMESTAMP('03/30/2016 09:57:36', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO pages VALUES (pages_sequence.nextval, 2, 'Attractions', 1, 16, TO_TIMESTAMP('04/07/2016 06:12:20', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO pages VALUES (pages_sequence.nextval, 2, 'Outdoors', 2, 16, TO_TIMESTAMP('03/28/2016 21:52:06', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO pages VALUES (pages_sequence.nextval, 3, 'Policy', 3, 0, TO_TIMESTAMP('04/04/2016 15:18:47', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO pages VALUES (pages_sequence.nextval, 3, 'Policy library', 1, 19, TO_TIMESTAMP('03/22/2016 22:47:09', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO pages VALUES (pages_sequence.nextval, 3, 'Governance', 1, 20, TO_TIMESTAMP('03/28/2016 22:42:05', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO pages VALUES (pages_sequence.nextval, 3, 'Operations', 2, 20, TO_TIMESTAMP('03/20/2016 12:54:21', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO pages VALUES (pages_sequence.nextval, 3, 'Resources', 2, 19, TO_TIMESTAMP('03/30/2016 09:57:36', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO pages VALUES (pages_sequence.nextval, 3, 'Templates', 1, 23, TO_TIMESTAMP('04/07/2016 06:12:20', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO pages VALUES (pages_sequence.nextval, 3, 'FAQ', 3, 19, TO_TIMESTAMP('03/30/2016 09:57:36', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO pages VALUES (pages_sequence.nextval, 3, 'Search', 4, 19, TO_TIMESTAMP('04/08/2016 10:43:51', 'MM/DD/YYYY HH24:MI:SS')); 

/* Create the contents table */
CREATE table contents (content_id int primary key not null, content_name varchar(200) not null, content_body long not null, content_updated_time timestamp not null, content_updated_by_user int references users(user_id) not null, page_id int references pages(page_id) not null);
CREATE SEQUENCE contents_sequence START WITH 1 INCREMENT BY 1; 
INSERT INTO contents VALUES (contents_sequence.nextval, 'odit minima ad ut in sapiente', 'Accusantium et explicabo laudantium. Ut voluptatem rerum dignissimos voluptatum facere velit iste quos. Consequuntur cupiditate amet quaerat. Officiis qui qui at aspernatur esse.

Veniam odit sed minima explicabo. Est a voluptatem dolor non saepe. Aspernatur et aut cupiditate fugit nam eligendi.

Nam sequi omnis sit perspiciatis molestiae asperiores et. Et eum eum veniam dignissimos eos quas rerum. Sint eum eos placeat.', CURRENT_TIMESTAMP, 9, 1);
INSERT INTO contents VALUES (contents_sequence.nextval, 'doloremque et sunt accusamus facere animi voluptates natus neque est', 'Ex sed et est atque animi. Rem dicta possimus est et adipisci nobis aut repudiandae. Blanditiis ipsam voluptas sed eum. Laudantium earum sed corrupti eos natus ut.

Consequatur non cupiditate autem. Recusandae debitis minus reprehenderit eos ex atque sed recusandae. Et accusamus minus pariatur quia voluptate ut est. Dolor mollitia dolore ea nisi.

Veritatis est debitis dolores in et minus autem veritatis. Est officia neque est numquam eveniet alias. Assumenda fuga rerum incidunt occaecati et.', CURRENT_TIMESTAMP, 1, 2); 
INSERT INTO contents VALUES (contents_sequence.nextval, 'ad enim ut vitae assumenda dolorem', 'Repellat doloremque dolores commodi sed enim sed. Rem cupiditate iusto illum esse rerum eum. Blanditiis alias vel dolor.

Et non quia eius voluptatem ratione. Ea officiis inventore iste vitae omnis eum. Modi consequatur ut quae nobis autem aut rerum.

Ut alias dolores suscipit. Vel est quia ut praesentium aut. Velit commodi corporis fugiat ut assumenda. Exercitationem repellendus sunt eaque voluptatibus maiores explicabo.', CURRENT_TIMESTAMP, 3, 3); 
INSERT INTO contents VALUES (contents_sequence.nextval, 'vel totam quia doloremque sint quia nesciunt temporibus ea', 'Doloremque error temporibus quam tempora voluptatem et. Ea in perferendis temporibus dolor iusto cum. Quia eum dignissimos magnam modi aliquam doloribus fuga. Ex sit soluta ratione qui occaecati consequuntur.

Eos velit odit numquam minima. Ut voluptatem ut sint error quisquam a. Perferendis rerum quia qui inventore earum.

Aut aperiam voluptatum culpa iste facere omnis. In et et corrupti debitis fugiat est. Sapiente quas necessitatibus odio tempore ad fugiat. Rerum dolorem ullam voluptatem ut.', CURRENT_TIMESTAMP, 4, 4);
INSERT INTO contents VALUES (contents_sequence.nextval, 'sapiente debitis id laboriosam ullam enim rerum', 'Esse ducimus atque incidunt. Rerum distinctio sit est rerum neque facilis officia. Et deleniti aspernatur et eius illum ducimus. Consequatur et optio qui nesciunt dignissimos vel quam.

Est qui ut illo. Est suscipit fugit soluta dicta pariatur quam ipsam. Debitis impedit velit aut architecto.

Harum et corporis repudiandae iste neque. Aspernatur necessitatibus similique eaque est omnis rem. Et nisi occaecati fugit ut dolores officiis incidunt ullam.', CURRENT_TIMESTAMP, 3, 5);
INSERT INTO contents VALUES (contents_sequence.nextval, 'omnis vel excepturi illum excepturi velit eos', 'Dolorem exercitationem fugiat voluptas neque et est magnam. Dolorem numquam beatae minima. Iusto in accusantium illum natus aut necessitatibus. Nesciunt et commodi optio earum.

Maxime quia distinctio sint. Soluta eaque sapiente a quasi libero. Omnis aut accusamus a ut id sapiente et.

Et unde maiores ad incidunt. Quo sapiente quod dignissimos id a nesciunt. Voluptas dolores numquam quam.', CURRENT_TIMESTAMP, 4, 6); 
INSERT INTO contents VALUES (contents_sequence.nextval, 'et et consequatur nulla error', 'Sint et excepturi officiis corporis earum quod quisquam omnis. Qui delectus veniam voluptatem molestiae. Est voluptas ipsum vitae dolores aperiam accusamus. In quisquam consequuntur voluptas assumenda sint ut.

Illo excepturi veritatis est necessitatibus maiores quibusdam cumque. Illo harum occaecati vitae vitae voluptatem. Sunt architecto assumenda sed ut tempora laboriosam exercitationem. Ex provident explicabo occaecati et eaque.

Eos rerum est molestias iste aut occaecati est. Dolores et delectus est velit. Perspiciatis repellat iste eligendi rerum atque. Voluptates doloribus amet mollitia explicabo perferendis consectetur.', CURRENT_TIMESTAMP, 9, 7); 
INSERT INTO contents VALUES (contents_sequence.nextval, 'nemo delectus reiciendis corrupti voluptas eum laudantium animi', 'Sit consequuntur in et quis minus. Deserunt aperiam aut quis laboriosam nihil. Eos officia facilis itaque voluptatem. Non quasi itaque vero tempore nesciunt asperiores.

Nihil velit dignissimos recusandae rerum animi. Qui sed et est deserunt modi eum expedita. Nemo autem est accusantium.

Hic qui et ut consectetur dignissimos nemo. Quae ut est in alias quas consequatur.', CURRENT_TIMESTAMP, 9, 8);
INSERT INTO contents VALUES (contents_sequence.nextval, 'aperiam non consectetur in', 'Asperiores assumenda ut qui possimus id sunt. Numquam iusto modi corrupti officia ex magni ipsa aliquam. Voluptatem minus ducimus quia quam.

Et quis explicabo dolorem aut eos est. Placeat illo doloribus ut labore officia illum veritatis. Molestias qui voluptate exercitationem eos voluptatibus ut qui. Aut eum qui incidunt debitis.

Inventore reprehenderit perferendis voluptatem praesentium rerum est. Sit doloribus nobis tempore accusamus quis. Saepe suscipit est est rerum. Eligendi consequuntur itaque corporis eos nihil sapiente quas.', CURRENT_TIMESTAMP, 2, 9); 
INSERT INTO contents VALUES (contents_sequence.nextval, 'et consequatur et vitae quasi aspernatur similique quibusdam sint eaque', 'Et debitis saepe aspernatur repudiandae pariatur. Dolor molestiae quidem ullam. Sed perferendis consequuntur velit in veniam rerum. Aliquam distinctio modi excepturi.

Exercitationem magni omnis hic deserunt. Odit ut quod nam non. Pariatur vitae expedita tenetur nemo perspiciatis.

Voluptas rerum atque aut. Quia hic voluptatem itaque aspernatur maxime.', CURRENT_TIMESTAMP, 2, 10); 
INSERT INTO contents VALUES (contents_sequence.nextval, 'reiciendis quod eum facilis fuga odio cupiditate beatae', 'Qui non quo et quo aut quam fuga. Aut et quo ullam molestias ea eum. Qui quia aspernatur corporis velit repellendus illo. Pariatur ut iusto iusto velit et ipsam. Neque libero neque totam doloremque ut deserunt.

Natus corporis est iure fuga facilis id saepe. Iusto aspernatur dolor veritatis. Aut vero quos et est cum.

Mollitia aut eum et culpa. Quo quidem ex delectus voluptatem a.', CURRENT_TIMESTAMP, 5, 11);
INSERT INTO contents VALUES (contents_sequence.nextval, 'sequi recusandae qui eos tenetur voluptates', 'Fugiat molestiae error occaecati sit aperiam et. Totam explicabo dolore doloremque vel non nam quos. Quis molestiae quisquam libero quos.

Itaque itaque atque possimus dolores magni doloremque. In nostrum architecto blanditiis dicta reiciendis harum. Libero quod ducimus qui doloribus autem maxime reiciendis.

Necessitatibus id voluptatem debitis quia maxime recusandae. Molestiae consequatur culpa et et repudiandae voluptas ratione. Quibusdam numquam velit quo et. Aut et esse facere qui omnis consequatur praesentium recusandae.', CURRENT_TIMESTAMP, 6, 12); 
INSERT INTO contents VALUES (contents_sequence.nextval, 'ullam modi minima voluptatem neque porro officia ut', 'Non at enim laborum perspiciatis. Ut consequuntur repellat omnis dignissimos.

Quaerat rerum reiciendis aliquam reiciendis reiciendis sunt omnis. Aut blanditiis a similique ex at architecto vel. Atque commodi aspernatur cum sunt qui aut.

Aliquid eum quasi est. Optio necessitatibus velit alias et cumque ut. Veniam vitae minus officiis voluptates voluptas unde. Itaque hic veniam iure non magnam earum ea odit.', CURRENT_TIMESTAMP, 7, 13); 
INSERT INTO contents VALUES (contents_sequence.nextval, 'optio non minus molestiae eum nulla', 'Enim ad eum aperiam amet nulla. Et consectetur et molestias et est. Dolorem molestias harum reiciendis laboriosam voluptas pariatur voluptatum. Corporis distinctio ipsum nisi ut atque et.

Necessitatibus quis voluptatem nam maiores sint aspernatur aut. Voluptatibus enim fugit laudantium porro. Nihil quia voluptatem quaerat iusto blanditiis.

Excepturi aut recusandae suscipit aut et eos. Voluptatem fuga vel perspiciatis ut ut voluptate nulla. Optio vel voluptatem cumque ex nostrum voluptatem animi. Tempora aspernatur sit alias amet est repellendus.', CURRENT_TIMESTAMP, 7, 14); 
INSERT INTO contents VALUES (contents_sequence.nextval, 'velit modi odit eius aut et', 'Cumque cupiditate quibusdam deleniti est explicabo. Eos nihil iusto aut id reiciendis vero soluta. Sequi ab aut et molestiae.

Ut nobis molestias sed facere nihil repudiandae error. Ut rerum perferendis blanditiis ex voluptas itaque. Porro tenetur ut magni sed incidunt.

Cupiditate ullam laborum mollitia quas vel nihil. Nam nemo nam molestiae temporibus cumque dolorem est. Aperiam et hic qui voluptas. Eius deserunt a beatae magnam aperiam atque perspiciatis. A quo ut asperiores eaque.', CURRENT_TIMESTAMP, 2, 15); 
INSERT INTO contents VALUES (contents_sequence.nextval, 'dolores error amet iste', 'Pariatur laborum et rem nostrum. Nam consequuntur impedit quod dolor. Odio qui aut omnis atque est voluptas.

Eligendi aut sed in. Harum sunt qui aut voluptatem alias quia. Tempora quidem qui magni labore. Soluta quasi consequuntur delectus maiores voluptatibus perspiciatis.

Sunt qui aliquam fugit dicta nulla dicta. Veritatis non provident assumenda. Ratione repellat cum odio velit molestiae recusandae. In occaecati quo animi dolor suscipit ut.', CURRENT_TIMESTAMP, 5, 16); 
INSERT INTO contents VALUES (contents_sequence.nextval, 'necessitatibus eligendi libero quas', 'Quia ut aliquid rerum consequatur nisi in. Illo accusamus minima quia cupiditate esse recusandae iste.

Voluptatem ut accusamus odit illo. Eum reprehenderit quia deleniti ad illum quis. Repudiandae consequuntur est culpa quos quod.

Quidem dolores commodi perspiciatis laudantium voluptas provident ipsa. Cumque eaque distinctio voluptates voluptates est porro perspiciatis. Quia voluptatem blanditiis voluptatem ipsam distinctio autem hic totam. Culpa molestiae non ullam fugiat est blanditiis maxime.', CURRENT_TIMESTAMP, 2, 17);
INSERT INTO contents VALUES (contents_sequence.nextval, 'ut porro ut et officiis quis cupiditate commodi possimus unde', 'Facilis consequatur quibusdam ut aspernatur unde repellendus illum. Porro quo eius et deleniti dolorem. Et quia et dolores corrupti.

Magnam dolore et nostrum at. Quod iste dolor quidem et distinctio ex numquam quam. Voluptatem nam aut enim ut tempore.

Quia asperiores ut cumque voluptatem sed. Aliquam deleniti quae vel ducimus iste quisquam. Rem labore at nostrum delectus quidem.', CURRENT_TIMESTAMP, 2, 18); 
INSERT INTO contents VALUES (contents_sequence.nextval, 'animi porro sed sit nulla cumque dolor enim aliquid', 'Tempora magni saepe unde animi sequi culpa neque. Architecto maiores architecto voluptatum aut labore. Laboriosam est vero quia minima. Ut culpa consequatur voluptatem exercitationem et. Placeat laborum tempora ab voluptas totam ea delectus esse.

Hic pariatur aut fuga quas. Deserunt commodi molestiae rerum consequatur. Vero voluptas et voluptatem qui vitae quas dolorem.

Voluptatem voluptatum fuga officia assumenda ut. Laborum quaerat ut tempore. Odit unde voluptatem necessitatibus illum rerum laborum. Blanditiis facilis sed exercitationem dolorum.', CURRENT_TIMESTAMP, 6, 19); 
INSERT INTO contents VALUES (contents_sequence.nextval, 'sed est consectetur tempora quidem nihil fugit quam repudiandae', 'Rem rerum commodi eveniet autem perspiciatis. At et magnam odio non nihil. Non harum eveniet dolorem corrupti.

At possimus corrupti pariatur consequatur explicabo ut sequi qui. Eaque rem voluptatem corporis dolor aspernatur hic quam. Et debitis molestias aut eaque. Voluptatem sit est quam et dolor sit distinctio.

Libero nam ut ipsa. Laborum et asperiores est soluta repellat numquam illo. Omnis nihil deleniti molestiae excepturi.', CURRENT_TIMESTAMP, 6, 20); 
INSERT INTO contents VALUES (contents_sequence.nextval, 'vero aut eius dicta facere omnis quo eligendi', 'Eligendi consequatur et molestiae modi eos sit. Quis pariatur ipsam suscipit numquam exercitationem eius. Pariatur voluptatem occaecati nobis consequuntur praesentium voluptatem quia. Rerum aut doloribus eos eaque ut sit.

Et ut quia harum officiis ducimus. Ut modi modi eligendi accusamus quidem ut. Quam sed delectus tempora illo quidem nihil sed est.

Expedita eveniet et consequatur officiis voluptates at incidunt. Et repudiandae placeat ab eum eos accusamus ipsa. Voluptatibus aut quia mollitia odit eum cumque aliquam. Architecto dolorem minus repellendus amet id voluptatibus eligendi.', CURRENT_TIMESTAMP, 8, 21); 
INSERT INTO contents VALUES (contents_sequence.nextval, 'qui voluptatem quibusdam ea quo dolor et magnam qui adipisci', 'Vitae enim laborum ducimus ipsum. Consequatur nulla itaque ut possimus debitis aliquam magni doloremque. Magni maiores non praesentium explicabo sit vel aut porro.

In est iure facilis sequi quod eveniet ut. Et nulla et expedita ea nisi iste quaerat. Vitae quis est nam rerum enim consequatur maiores.

Est sit dolorem delectus debitis. Sapiente nihil enim qui sed minus. Omnis repudiandae velit incidunt non.', CURRENT_TIMESTAMP, 8, 22);
INSERT INTO contents VALUES (contents_sequence.nextval, 'nobis perferendis praesentium aperiam quia asperiores quas neque et aut', 'Omnis tempore et quis qui ex voluptas. Cum dicta autem voluptas sapiente repellendus at quia dicta. Omnis corrupti sit omnis aut quaerat.

Rerum qui ipsum deserunt. Alias rerum aut aliquid voluptatem quis.

Odio doloribus dignissimos culpa voluptas. Consequatur recusandae consequatur porro modi unde. Rerum odio omnis est tempora.', CURRENT_TIMESTAMP, 6, 23); 
INSERT INTO contents VALUES (contents_sequence.nextval, 'eum sit facilis natus', 'Omnis velit in consequatur cumque nostrum nobis. Officia quasi nesciunt perspiciatis. Et excepturi incidunt qui maxime. Nam blanditiis cupiditate impedit eveniet non id quod.

Itaque dignissimos a voluptas saepe fugit sunt. Aut et temporibus dicta nihil velit ad quia. Error earum et temporibus eaque quia.

Itaque ratione nulla provident et enim vel. Vero adipisci ratione et quibusdam. Quidem dignissimos porro magni id cum repellendus. Facere numquam hic quia perspiciatis voluptatibus inventore quia.', CURRENT_TIMESTAMP, 6, 24); 
INSERT INTO contents VALUES (contents_sequence.nextval, 'deleniti eligendi sed nemo nihil unde doloribus qui reprehenderit quia', 'Recusandae velit ducimus aut. Accusantium voluptas molestiae voluptas quam doloremque voluptate.

Molestiae numquam ab rerum deserunt et deserunt laudantium. Odio sequi quis veniam ut rerum ab recusandae. Repellendus vero quia ut voluptatem omnis nam illum ipsam.

Omnis quidem ratione earum maxime et. Voluptas repellendus veniam praesentium iure distinctio incidunt dolorem. Vero nobis voluptas quisquam atque eum tempora voluptatem.', CURRENT_TIMESTAMP, 8, 25); 
INSERT INTO contents VALUES (contents_sequence.nextval, 'quos et laborum nostrum perferendis consequuntur sed ratione sed', 'Corrupti qui nihil animi maiores molestiae vel. Similique ab consequatur eum qui fugit. Et praesentium et est deleniti sed quae officia. Laborum qui consequatur aliquid porro id.

Cupiditate itaque quas unde reprehenderit laborum neque esse. Facilis porro et consequatur praesentium aliquam sit.

Cupiditate in non et dolor. Veritatis pariatur quae nobis animi tenetur sunt. Culpa voluptatem dolores voluptas et.', CURRENT_TIMESTAMP, 6, 26); 

/* Create the visits table */
CREATE table visits (visit_ip varchar(100) not null, page_id int references pages(page_id) not null, visit_timestamp timestamp not null);
INSERT INTO visits VALUES ('47.160.233.11', 8, TO_TIMESTAMP('04/16/2016 02:46:32', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('202.100.140.109', 1, TO_TIMESTAMP('03/27/2016 09:29:41', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('156.105.55.166', 4, TO_TIMESTAMP('04/07/2016 12:09:39', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('186.200.139.128', 3, TO_TIMESTAMP('04/02/2016 07:06:36', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('179.238.78.218', 7, TO_TIMESTAMP('04/17/2016 02:34:32', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('127.50.142.139', 8, TO_TIMESTAMP('04/16/2016 19:07:35', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('178.127.211.41', 9, TO_TIMESTAMP('04/14/2016 13:17:53', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('78.225.27.11', 7, TO_TIMESTAMP('04/08/2016 20:30:07', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('151.211.168.157', 9, TO_TIMESTAMP('03/29/2016 14:41:33', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('161.252.182.201', 6, TO_TIMESTAMP('04/05/2016 13:11:43', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('32.27.29.222', 7, TO_TIMESTAMP('04/02/2016 09:22:15', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('214.192.238.35', 9, TO_TIMESTAMP('03/21/2016 23:13:10', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('209.185.142.98', 2, TO_TIMESTAMP('03/25/2016 20:19:25', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('40.94.125.140', 1, TO_TIMESTAMP('03/22/2016 03:51:59', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('62.121.11.82', 10, TO_TIMESTAMP('04/17/2016 02:11:24', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('39.142.179.81', 9, TO_TIMESTAMP('04/02/2016 11:07:37', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('77.194.32.75', 10, TO_TIMESTAMP('03/19/2016 16:39:39', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('64.187.180.22', 2, TO_TIMESTAMP('04/10/2016 14:51:02', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('176.74.102.204', 4, TO_TIMESTAMP('03/22/2016 21:22:29', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('247.80.190.13', 2, TO_TIMESTAMP('04/09/2016 13:08:23', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('73.100.113.18', 2, TO_TIMESTAMP('04/08/2016 19:08:03', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('127.32.74.97', 2, TO_TIMESTAMP('03/31/2016 02:20:14', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('182.66.98.202', 6, TO_TIMESTAMP('04/05/2016 04:54:53', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('90.196.241.157', 9, TO_TIMESTAMP('04/10/2016 02:49:07', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('185.99.166.161', 3, TO_TIMESTAMP('04/17/2016 12:54:56', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('76.189.49.95', 7, TO_TIMESTAMP('03/28/2016 07:16:48', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('25.201.147.131', 4, TO_TIMESTAMP('03/28/2016 08:07:37', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('39.141.254.64', 6, TO_TIMESTAMP('04/06/2016 06:55:42', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('181.198.16.18', 3, TO_TIMESTAMP('03/30/2016 00:35:44', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('185.117.37.230', 3, TO_TIMESTAMP('04/14/2016 13:39:35', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('155.170.99.85', 8, TO_TIMESTAMP('04/11/2016 02:06:21', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('235.30.185.110', 10, TO_TIMESTAMP('04/10/2016 20:39:06', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('251.157.177.138', 4, TO_TIMESTAMP('04/14/2016 13:54:49', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('77.182.155.2', 1, TO_TIMESTAMP('04/11/2016 12:37:57', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('133.26.189.179', 3, TO_TIMESTAMP('04/14/2016 13:20:04', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('207.75.151.216', 10, TO_TIMESTAMP('04/03/2016 17:54:35', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('77.185.250.47', 8, TO_TIMESTAMP('03/22/2016 05:49:58', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('24.153.112.170', 1, TO_TIMESTAMP('03/20/2016 08:30:50', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('18.164.188.221', 7, TO_TIMESTAMP('04/17/2016 09:07:31', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('159.163.69.174', 7, TO_TIMESTAMP('03/23/2016 09:55:48', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('245.228.92.244', 6, TO_TIMESTAMP('04/15/2016 08:38:57', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('178.238.177.129', 3, TO_TIMESTAMP('03/22/2016 08:17:03', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('16.173.66.67', 6, TO_TIMESTAMP('03/27/2016 16:31:41', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('98.255.79.3', 7, TO_TIMESTAMP('03/24/2016 10:48:28', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('252.93.130.134', 4, TO_TIMESTAMP('04/15/2016 01:55:56', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('0.153.91.32', 5, TO_TIMESTAMP('04/10/2016 13:47:34', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('211.139.173.22', 5, TO_TIMESTAMP('04/12/2016 15:59:27', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('155.62.3.54', 4, TO_TIMESTAMP('03/23/2016 07:49:11', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('236.202.118.156', 6, TO_TIMESTAMP('04/01/2016 23:39:47', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('116.175.175.2', 8, TO_TIMESTAMP('04/17/2016 08:40:08', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('114.111.244.158', 5, TO_TIMESTAMP('03/23/2016 05:29:56', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('181.152.2.26', 8, TO_TIMESTAMP('03/30/2016 05:53:10', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('48.203.250.222', 10, TO_TIMESTAMP('04/06/2016 21:35:45', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('177.183.17.180', 1, TO_TIMESTAMP('04/05/2016 19:24:56', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('5.67.61.140', 7, TO_TIMESTAMP('04/11/2016 00:51:27', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('234.15.60.71', 2, TO_TIMESTAMP('03/26/2016 23:26:53', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('20.253.3.13', 7, TO_TIMESTAMP('03/27/2016 06:12:38', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('69.67.74.161', 10, TO_TIMESTAMP('04/02/2016 09:40:56', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('255.12.91.110', 8, TO_TIMESTAMP('03/21/2016 07:23:15', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('77.160.0.125', 9, TO_TIMESTAMP('04/04/2016 22:06:06', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('226.253.47.36', 2, TO_TIMESTAMP('03/18/2016 14:51:56', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('42.193.174.218', 5, TO_TIMESTAMP('04/10/2016 23:11:39', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('249.220.79.85', 9, TO_TIMESTAMP('04/07/2016 04:19:42', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('154.177.94.93', 6, TO_TIMESTAMP('03/22/2016 15:39:29', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('40.6.221.52', 5, TO_TIMESTAMP('04/04/2016 06:47:33', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('181.213.63.31', 1, TO_TIMESTAMP('04/02/2016 18:21:44', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('83.180.140.55', 5, TO_TIMESTAMP('03/26/2016 04:10:36', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('25.161.19.14', 3, TO_TIMESTAMP('04/10/2016 16:12:26', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('130.75.23.166', 2, TO_TIMESTAMP('03/20/2016 21:57:44', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('158.67.255.175', 1, TO_TIMESTAMP('03/29/2016 00:45:18', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('41.192.3.178', 9, TO_TIMESTAMP('04/17/2016 18:08:12', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('169.170.65.12', 8, TO_TIMESTAMP('04/03/2016 13:16:34', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('178.134.79.36', 4, TO_TIMESTAMP('03/25/2016 16:55:10', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('122.93.147.42', 4, TO_TIMESTAMP('03/22/2016 18:08:26', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('137.119.84.34', 5, TO_TIMESTAMP('04/02/2016 06:34:28', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('158.218.249.53', 7, TO_TIMESTAMP('03/27/2016 11:40:32', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('123.78.124.89', 9, TO_TIMESTAMP('04/12/2016 13:52:46', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('54.88.119.22', 10, TO_TIMESTAMP('04/15/2016 14:07:24', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('3.199.13.239', 1, TO_TIMESTAMP('04/12/2016 00:19:09', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('19.32.246.196', 5, TO_TIMESTAMP('03/20/2016 11:31:04', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('204.38.173.3', 8, TO_TIMESTAMP('03/21/2016 03:13:06', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('58.101.98.191', 6, TO_TIMESTAMP('03/22/2016 02:47:22', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('145.60.214.214', 3, TO_TIMESTAMP('03/28/2016 08:45:24', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('50.29.177.42', 7, TO_TIMESTAMP('03/22/2016 16:37:13', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('100.98.238.32', 6, TO_TIMESTAMP('03/18/2016 01:07:18', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('91.131.44.244', 9, TO_TIMESTAMP('04/01/2016 10:31:31', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('140.185.160.250', 8, TO_TIMESTAMP('03/28/2016 01:39:02', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('209.102.64.200', 3, TO_TIMESTAMP('04/12/2016 02:38:38', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('41.235.93.158', 8, TO_TIMESTAMP('03/25/2016 20:46:02', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('150.225.101.22', 6, TO_TIMESTAMP('04/10/2016 19:26:00', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('81.42.18.250', 2, TO_TIMESTAMP('04/14/2016 09:34:12', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('189.7.11.65', 10, TO_TIMESTAMP('04/01/2016 18:53:51', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('15.92.217.100', 10, TO_TIMESTAMP('04/17/2016 10:08:19', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('52.100.196.130', 10, TO_TIMESTAMP('03/28/2016 05:46:46', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('15.35.214.168', 5, TO_TIMESTAMP('03/31/2016 21:47:44', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('27.173.86.167', 5, TO_TIMESTAMP('04/14/2016 15:38:16', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('20.186.187.74', 1, TO_TIMESTAMP('04/11/2016 13:01:00', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('36.25.254.201', 9, TO_TIMESTAMP('03/31/2016 06:17:45', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('54.243.180.152', 8, TO_TIMESTAMP('03/24/2016 19:51:19', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('243.33.83.193', 3, TO_TIMESTAMP('04/09/2016 21:28:23', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('15.224.6.171', 10, TO_TIMESTAMP('04/15/2016 15:06:56', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('84.91.72.11', 6, TO_TIMESTAMP('04/17/2016 12:40:38', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('172.133.245.219', 10, TO_TIMESTAMP('03/29/2016 20:32:45', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('97.15.193.131', 3, TO_TIMESTAMP('03/20/2016 04:24:25', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('118.52.33.7', 10, TO_TIMESTAMP('04/14/2016 19:50:28', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('18.62.172.36', 4, TO_TIMESTAMP('04/15/2016 03:57:46', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('110.24.19.150', 10, TO_TIMESTAMP('04/14/2016 00:11:01', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('133.67.224.8', 9, TO_TIMESTAMP('03/19/2016 17:35:10', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('140.90.142.16', 3, TO_TIMESTAMP('04/03/2016 04:23:49', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('86.2.24.168', 10, TO_TIMESTAMP('04/05/2016 22:54:05', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('177.53.203.20', 4, TO_TIMESTAMP('03/21/2016 21:15:50', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('182.19.128.83', 10, TO_TIMESTAMP('03/21/2016 00:00:37', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('110.249.122.224', 6, TO_TIMESTAMP('03/27/2016 22:12:08', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('20.237.162.149', 6, TO_TIMESTAMP('04/04/2016 07:44:11', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('119.57.159.28', 7, TO_TIMESTAMP('04/10/2016 15:48:32', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('109.253.47.102', 1, TO_TIMESTAMP('03/28/2016 12:20:25', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('39.164.218.235', 4, TO_TIMESTAMP('04/14/2016 08:40:08', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('212.218.159.105', 5, TO_TIMESTAMP('03/28/2016 10:21:52', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('85.21.14.44', 4, TO_TIMESTAMP('04/03/2016 15:35:39', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('160.89.182.173', 2, TO_TIMESTAMP('03/22/2016 04:44:24', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('16.212.84.181', 10, TO_TIMESTAMP('03/27/2016 17:59:35', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('44.150.8.124', 5, TO_TIMESTAMP('04/17/2016 03:33:28', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('45.247.142.249', 1, TO_TIMESTAMP('03/27/2016 06:20:02', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('12.157.164.156', 9, TO_TIMESTAMP('03/18/2016 17:50:43', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('233.6.87.186', 5, TO_TIMESTAMP('03/19/2016 07:26:13', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('59.78.30.116', 5, TO_TIMESTAMP('03/23/2016 00:34:22', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('170.209.159.137', 4, TO_TIMESTAMP('04/08/2016 03:17:30', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('209.221.8.58', 6, TO_TIMESTAMP('04/02/2016 14:58:12', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('116.215.216.193', 4, TO_TIMESTAMP('03/27/2016 04:58:52', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('125.127.82.121', 1, TO_TIMESTAMP('04/02/2016 03:08:44', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('120.84.253.83', 8, TO_TIMESTAMP('03/23/2016 20:23:00', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('114.59.203.235', 3, TO_TIMESTAMP('04/12/2016 02:21:21', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('51.178.74.91', 7, TO_TIMESTAMP('03/24/2016 03:57:00', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('185.58.11.156', 7, TO_TIMESTAMP('04/04/2016 17:38:10', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('63.23.99.233', 6, TO_TIMESTAMP('04/05/2016 02:13:54', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('186.215.135.188', 7, TO_TIMESTAMP('03/23/2016 14:56:40', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('23.179.183.198', 1, TO_TIMESTAMP('04/07/2016 08:54:11', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('121.153.221.29', 5, TO_TIMESTAMP('04/13/2016 02:30:44', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('58.157.42.42', 5, TO_TIMESTAMP('04/01/2016 13:56:53', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('233.69.112.98', 4, TO_TIMESTAMP('04/07/2016 13:03:34', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('173.73.165.171', 5, TO_TIMESTAMP('03/18/2016 16:32:00', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('40.211.108.222', 9, TO_TIMESTAMP('03/17/2016 19:13:22', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('9.60.212.40', 3, TO_TIMESTAMP('04/09/2016 04:39:17', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('226.86.192.74', 10, TO_TIMESTAMP('04/05/2016 19:53:41', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('204.76.219.107', 4, TO_TIMESTAMP('03/22/2016 09:14:51', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('183.199.5.3', 9, TO_TIMESTAMP('03/30/2016 17:36:21', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('184.77.123.237', 10, TO_TIMESTAMP('04/03/2016 21:43:54', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('3.61.34.17', 7, TO_TIMESTAMP('03/20/2016 20:51:22', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('7.179.81.241', 3, TO_TIMESTAMP('03/25/2016 10:30:51', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('124.226.156.250', 4, TO_TIMESTAMP('04/07/2016 11:16:36', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('93.59.125.237', 9, TO_TIMESTAMP('03/18/2016 19:44:52', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('230.210.209.171', 3, TO_TIMESTAMP('04/03/2016 21:55:53', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('158.196.136.0', 8, TO_TIMESTAMP('03/27/2016 13:03:00', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('198.126.253.57', 9, TO_TIMESTAMP('04/14/2016 21:20:31', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('94.167.229.89', 2, TO_TIMESTAMP('04/13/2016 19:28:11', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('14.124.85.177', 2, TO_TIMESTAMP('03/28/2016 06:43:29', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('150.37.23.184', 4, TO_TIMESTAMP('04/06/2016 06:44:27', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('159.98.6.173', 5, TO_TIMESTAMP('04/01/2016 01:46:40', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('237.203.104.142', 7, TO_TIMESTAMP('03/27/2016 19:49:41', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('136.10.130.10', 8, TO_TIMESTAMP('04/06/2016 01:08:04', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('11.1.25.114', 6, TO_TIMESTAMP('04/16/2016 23:46:50', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('193.163.136.158', 5, TO_TIMESTAMP('04/17/2016 15:47:55', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('147.233.242.59', 1, TO_TIMESTAMP('04/01/2016 19:32:18', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('33.129.87.124', 2, TO_TIMESTAMP('04/06/2016 01:11:18', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('25.166.129.172', 2, TO_TIMESTAMP('03/28/2016 19:50:41', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('132.176.192.37', 6, TO_TIMESTAMP('04/13/2016 02:32:14', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('169.59.154.113', 8, TO_TIMESTAMP('04/16/2016 05:58:36', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('164.41.104.51', 2, TO_TIMESTAMP('04/11/2016 17:27:07', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('242.10.163.118', 10, TO_TIMESTAMP('03/30/2016 11:28:00', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('176.229.2.122', 3, TO_TIMESTAMP('04/17/2016 15:41:45', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('232.229.2.135', 5, TO_TIMESTAMP('03/20/2016 10:30:23', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('28.88.120.254', 4, TO_TIMESTAMP('03/23/2016 06:00:06', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('38.15.233.62', 1, TO_TIMESTAMP('04/06/2016 16:20:48', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('32.112.131.89', 8, TO_TIMESTAMP('04/06/2016 05:19:46', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('89.10.105.172', 3, TO_TIMESTAMP('04/10/2016 23:12:18', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('203.246.147.39', 5, TO_TIMESTAMP('04/01/2016 14:54:38', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('195.181.76.169', 7, TO_TIMESTAMP('04/17/2016 01:39:35', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('191.207.153.213', 3, TO_TIMESTAMP('03/24/2016 02:18:03', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('54.171.10.165', 2, TO_TIMESTAMP('03/18/2016 22:48:10', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('114.212.174.40', 10, TO_TIMESTAMP('03/21/2016 19:09:43', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('169.177.219.54', 6, TO_TIMESTAMP('03/18/2016 14:59:24', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('124.236.37.145', 10, TO_TIMESTAMP('04/01/2016 23:25:00', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('4.86.232.130', 2, TO_TIMESTAMP('04/16/2016 07:00:47', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('217.249.201.20', 4, TO_TIMESTAMP('04/17/2016 04:28:43', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('203.233.69.81', 9, TO_TIMESTAMP('04/03/2016 09:00:47', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('37.143.29.43', 3, TO_TIMESTAMP('04/17/2016 12:02:53', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('232.187.64.153', 6, TO_TIMESTAMP('04/07/2016 17:26:45', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('209.58.36.141', 2, TO_TIMESTAMP('04/13/2016 15:03:19', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('160.144.89.117', 8, TO_TIMESTAMP('04/05/2016 23:41:54', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('236.224.218.134', 3, TO_TIMESTAMP('04/09/2016 06:57:20', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('12.39.85.104', 10, TO_TIMESTAMP('04/16/2016 10:53:48', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('133.216.3.31', 3, TO_TIMESTAMP('04/02/2016 18:11:27', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('148.25.248.171', 7, TO_TIMESTAMP('03/18/2016 22:30:21', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('217.96.3.193', 10, TO_TIMESTAMP('04/02/2016 22:12:34', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('180.129.187.3', 5, TO_TIMESTAMP('04/05/2016 20:44:22', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('101.125.44.224', 8, TO_TIMESTAMP('04/03/2016 14:12:54', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('79.237.249.40', 5, TO_TIMESTAMP('03/21/2016 11:43:34', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('227.217.6.121', 3, TO_TIMESTAMP('04/02/2016 05:44:19', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('46.4.221.4', 10, TO_TIMESTAMP('03/17/2016 20:13:50', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('172.153.128.213', 5, TO_TIMESTAMP('03/26/2016 13:39:49', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('102.129.58.94', 6, TO_TIMESTAMP('03/28/2016 16:18:51', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('132.115.17.104', 4, TO_TIMESTAMP('03/22/2016 05:52:40', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('10.155.191.82', 8, TO_TIMESTAMP('04/15/2016 09:29:13', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('199.174.53.223', 6, TO_TIMESTAMP('03/18/2016 16:49:55', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('240.143.205.128', 2, TO_TIMESTAMP('04/01/2016 01:45:18', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('248.166.140.95', 1, TO_TIMESTAMP('04/16/2016 01:23:03', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('216.60.79.98', 1, TO_TIMESTAMP('03/21/2016 02:30:12', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('6.166.190.182', 8, TO_TIMESTAMP('04/03/2016 07:37:31', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('211.137.7.158', 4, TO_TIMESTAMP('03/20/2016 08:18:10', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('192.252.221.28', 2, TO_TIMESTAMP('04/09/2016 03:18:03', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('235.13.176.187', 7, TO_TIMESTAMP('04/09/2016 12:28:41', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('106.51.23.207', 10, TO_TIMESTAMP('04/15/2016 21:42:23', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('66.134.208.131', 1, TO_TIMESTAMP('03/21/2016 18:10:38', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('116.13.83.77', 9, TO_TIMESTAMP('03/24/2016 06:19:20', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('254.86.186.68', 3, TO_TIMESTAMP('04/11/2016 01:31:42', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('220.169.24.51', 9, TO_TIMESTAMP('03/23/2016 21:48:30', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('186.179.105.196', 2, TO_TIMESTAMP('03/31/2016 08:47:11', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('205.25.92.249', 8, TO_TIMESTAMP('04/04/2016 01:59:07', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('180.112.185.189', 1, TO_TIMESTAMP('03/22/2016 21:43:49', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('138.83.119.52', 9, TO_TIMESTAMP('03/19/2016 22:37:10', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('161.161.19.121', 10, TO_TIMESTAMP('03/31/2016 17:44:23', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('47.137.170.64', 10, TO_TIMESTAMP('03/29/2016 12:21:41', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('19.217.222.102', 2, TO_TIMESTAMP('04/10/2016 03:56:59', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('223.55.232.166', 7, TO_TIMESTAMP('03/22/2016 15:52:33', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('105.144.249.74', 10, TO_TIMESTAMP('04/05/2016 22:12:29', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('134.159.112.110', 6, TO_TIMESTAMP('04/11/2016 14:42:43', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('129.156.234.95', 4, TO_TIMESTAMP('04/15/2016 00:37:06', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('169.139.128.149', 4, TO_TIMESTAMP('03/21/2016 12:38:34', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('145.122.96.249', 8, TO_TIMESTAMP('04/02/2016 18:39:33', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('129.119.116.118', 3, TO_TIMESTAMP('03/20/2016 15:16:52', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('61.137.213.146', 9, TO_TIMESTAMP('03/26/2016 21:02:17', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('162.165.223.33', 3, TO_TIMESTAMP('04/15/2016 06:27:05', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('147.156.64.192', 7, TO_TIMESTAMP('04/12/2016 20:51:20', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('140.89.99.240', 6, TO_TIMESTAMP('04/11/2016 05:46:38', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('153.60.113.50', 9, TO_TIMESTAMP('03/27/2016 21:35:46', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('241.202.125.38', 8, TO_TIMESTAMP('04/09/2016 13:08:15', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('85.9.174.227', 7, TO_TIMESTAMP('04/01/2016 03:12:24', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('57.113.160.177', 10, TO_TIMESTAMP('04/03/2016 21:42:18', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('230.12.197.3', 5, TO_TIMESTAMP('03/25/2016 00:09:32', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('11.62.90.245', 10, TO_TIMESTAMP('03/20/2016 03:54:44', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('232.22.170.178', 1, TO_TIMESTAMP('03/27/2016 07:05:02', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('213.87.229.194', 2, TO_TIMESTAMP('03/28/2016 08:09:20', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('183.122.18.65', 10, TO_TIMESTAMP('03/19/2016 09:16:41', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('109.70.250.34', 2, TO_TIMESTAMP('04/03/2016 06:54:09', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('215.80.138.193', 10, TO_TIMESTAMP('03/19/2016 17:31:47', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('187.83.120.105', 2, TO_TIMESTAMP('04/11/2016 22:53:36', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('93.249.216.100', 1, TO_TIMESTAMP('03/25/2016 22:29:39', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('254.198.203.178', 1, TO_TIMESTAMP('03/27/2016 14:29:16', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('17.20.190.45', 10, TO_TIMESTAMP('04/03/2016 20:20:01', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('63.141.43.239', 2, TO_TIMESTAMP('03/18/2016 20:43:37', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO visits VALUES ('44.220.24.161', 10, TO_TIMESTAMP('03/29/2016 23:42:12', 'MM/DD/YYYY HH24:MI:SS')); 

/* Create the settings table */
CREATE table settings (setting_id int primary key not null, website_id references websites(website_id) not null, setting_name varchar(50) not null, setting_value varchar(50), setting_type varchar(50) not null);
CREATE SEQUENCE settings_sequence START WITH 1 INCREMENT BY 1; 
INSERT INTO settings VALUES (settings_sequence.nextval, 1, 'Login Alerts', 'Notification On', 'S'); 
INSERT INTO settings VALUES (settings_sequence.nextval, 1, 'Login Approval', 'Security Code Required', 'S'); 
INSERT INTO settings VALUES (settings_sequence.nextval, 1, 'App Password', 'Finger Print', 'S'); 
INSERT INTO settings VALUES (settings_sequence.nextval, 1, 'Multifactor Authentication', 'TRUE', 'S'); 
INSERT INTO settings VALUES (settings_sequence.nextval, 1, 'Max login attempts', '5', 'S'); 
INSERT INTO settings VALUES (settings_sequence.nextval, 1, 'Name', 'Peter Griffin', 'G'); 
INSERT INTO settings VALUES (settings_sequence.nextval, 1, 'Username', 'FamilyGuy', 'G'); 
INSERT INTO settings VALUES (settings_sequence.nextval, 1, 'Email', 'PeterGriffin@FamilyGuy.com', 'G'); 
INSERT INTO settings VALUES (settings_sequence.nextval, 1, 'Password', 'ShutUpMeg', 'G'); 
INSERT INTO settings VALUES (settings_sequence.nextval, 1, 'Networks', 'Quahog, RI', 'G'); 
INSERT INTO settings VALUES (settings_sequence.nextval, 1, 'Temperature', 'Farenheit', 'G'); 
INSERT INTO settings VALUES (settings_sequence.nextval, 1, 'Time Zone', 'UTC-05:00', 'G'); 
INSERT INTO settings VALUES (settings_sequence.nextval, 1, 'Lanuage', 'English', 'G'); 
INSERT INTO settings VALUES (settings_sequence.nextval, 1, 'Who can see my stuff', 'Everyone', 'P'); 
INSERT INTO settings VALUES (settings_sequence.nextval, 1, 'Who can contact me', 'Everyone', 'P'); 
INSERT INTO settings VALUES (settings_sequence.nextval, 1, 'Who can look me up', 'Everyone', 'P'); 
INSERT INTO settings VALUES (settings_sequence.nextval, 2, 'Name', 'Eric Cartman', 'G'); 
INSERT INTO settings VALUES (settings_sequence.nextval, 2, 'Username', 'Southpark', 'G'); 
INSERT INTO settings VALUES (settings_sequence.nextval, 2, 'Email', 'EricCartman@Southpark.com', 'G'); 
INSERT INTO settings VALUES (settings_sequence.nextval, 2, 'Password', 'RespectMyAuthority', 'G'); 
INSERT INTO settings VALUES (settings_sequence.nextval, 2, 'Networks', 'Southpark, CO', 'G'); 
INSERT INTO settings VALUES (settings_sequence.nextval, 2, 'Temperature', 'Farenheit', 'G'); 
INSERT INTO settings VALUES (settings_sequence.nextval, 2, 'Time Zone', 'UTC-07:00', 'G'); 
INSERT INTO settings VALUES (settings_sequence.nextval, 2, 'Lanuage', 'English', 'G'); 
INSERT INTO settings VALUES (settings_sequence.nextval, 2, 'Who can see my stuff', 'Everyone', 'P'); 
INSERT INTO settings VALUES (settings_sequence.nextval, 2, 'Who can contact me', 'Users Only', 'P'); 
INSERT INTO settings VALUES (settings_sequence.nextval, 2, 'Who can look me up', 'Users Only', 'P'); 
INSERT INTO settings VALUES (settings_sequence.nextval, 2, 'Search engine visibility', 'TRUE', 'P'); 
INSERT INTO settings VALUES (settings_sequence.nextval, 2, 'Enable privacy policy', 'FALSE', 'P'); 
INSERT INTO settings VALUES (settings_sequence.nextval, 2, 'Login Alerts', 'Notification On', 'S'); 
INSERT INTO settings VALUES (settings_sequence.nextval, 2, 'Login Approvals', 'Security Code Required', 'S'); 
INSERT INTO settings VALUES (settings_sequence.nextval, 2, 'App Password', 'Finger Print', 'S'); 
INSERT INTO settings VALUES (settings_sequence.nextval, 2, 'Multifactor Authentication', 'TRUE', 'S'); 
INSERT INTO settings VALUES (settings_sequence.nextval, 2, 'Max login attempts', '5', 'S'); 

/* Create the settings_security table */
CREATE table settings_security (security_id int references settings(setting_id) not null primary key, protocol int not null, update_timestamp timestamp not null);
INSERT INTO settings_security VALUES (1, 1, TO_TIMESTAMP('03/29/2016 07:04:44', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO settings_security VALUES (2, 0, TO_TIMESTAMP('04/01/2016 22:33:07', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO settings_security VALUES (3, 1, TO_TIMESTAMP('03/26/2016 15:46:01', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO settings_security VALUES (4, 0, TO_TIMESTAMP('03/27/2016 22:41:39', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO settings_security VALUES (5, 1, TO_TIMESTAMP('04/09/2016 20:11:07', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO settings_security VALUES (30, 1, TO_TIMESTAMP('04/10/2016 18:33:24', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO settings_security VALUES (31, 0, TO_TIMESTAMP('03/17/2016 04:50:50', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO settings_security VALUES (32, 0, TO_TIMESTAMP('03/27/2016 22:41:39', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO settings_security VALUES (33, 1, TO_TIMESTAMP('03/18/2016 20:25:12', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO settings_security VALUES (34, 1, TO_TIMESTAMP('03/31/2016 06:47:50', 'MM/DD/YYYY HH24:MI:SS')); 

/* Create the settings_privacy table */
CREATE table settings_privacy (privacy_id int references settings(setting_id) not null primary key, review_date timestamp not null);
INSERT INTO settings_privacy VALUES (14, TO_TIMESTAMP('04/09/2016 20:11:07', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO settings_privacy VALUES (15, TO_TIMESTAMP('03/31/2016 06:47:50', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO settings_privacy VALUES (16, TO_TIMESTAMP('03/18/2016 20:25:12', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO settings_privacy VALUES (25, TO_TIMESTAMP('03/14/2016 03:39:38', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO settings_privacy VALUES (26, TO_TIMESTAMP('03/01/2016 07:04:44', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO settings_privacy VALUES (27, TO_TIMESTAMP('03/23/2016 06:47:50', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO settings_privacy VALUES (28, TO_TIMESTAMP('03/25/2016 08:23:45', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO settings_privacy VALUES (29, TO_TIMESTAMP('03/03/2016 01:01:00', 'MM/DD/YYYY HH24:MI:SS')); 

/* Create the settings_general table */
CREATE table settings_general (general_id int references settings(setting_id) not null primary key, last_change_date timestamp not null);
INSERT INTO settings_general VALUES (6, TO_TIMESTAMP('04/09/2016 20:11:07', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO settings_general VALUES (7, TO_TIMESTAMP('03/31/2016 06:47:50', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO settings_general VALUES (8, TO_TIMESTAMP('03/18/2016 20:25:12', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO settings_general VALUES (9, TO_TIMESTAMP('03/14/2016 03:39:38', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO settings_general VALUES (10, TO_TIMESTAMP('03/01/2016 07:04:44', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO settings_general VALUES (11, TO_TIMESTAMP('03/23/2016 06:47:50', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO settings_general VALUES (12, TO_TIMESTAMP('03/25/2016 08:23:45', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO settings_general VALUES (13, TO_TIMESTAMP('03/03/2016 01:01:00', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO settings_general VALUES (18, TO_TIMESTAMP('04/10/2016 05:29:23', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO settings_general VALUES (19, TO_TIMESTAMP('03/26/2016 15:46:01', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO settings_general VALUES (20, TO_TIMESTAMP('03/19/2016 16:20:59', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO settings_general VALUES (21, TO_TIMESTAMP('04/07/2016 03:32:24', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO settings_general VALUES (22, TO_TIMESTAMP('04/10/2016 05:29:23', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO settings_general VALUES (23, TO_TIMESTAMP('04/04/2016 22:15:18', 'MM/DD/YYYY HH24:MI:SS')); 
INSERT INTO settings_general VALUES (24, TO_TIMESTAMP('03/01/2016 13:44:23', 'MM/DD/YYYY HH24:MI:SS')); 

