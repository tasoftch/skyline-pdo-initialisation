create table COMPONENT_ITEM_TYPE
(
    id integer primary key auto_increment,
    caption text not null,
    description text default null,
    className text not null,
    mimeType text not null,
    relation text default null,
    icon text default null,
    editable integer default 0
);

INSERT INTO COMPONENT_ITEM_TYPE (id, caption, className, mimeType, relation, icon) VALUES (1, 'Unknown', '', 'application/octet-stream', null, 'fa-question-mark');
INSERT INTO COMPONENT_ITEM_TYPE (id, caption, className, mimeType, relation, icon, editable, description) VALUES (2, 'Cascading Style Sheet', 'Skyline\HTML\Head\LinkCSS', 'text/css', 'stylesheet', 'fa-code', 1, 'Cascading Stylesheet source from an existing or uploaded file on your server.');
INSERT INTO COMPONENT_ITEM_TYPE (id, caption, className, mimeType, relation, icon, editable, description) VALUES (3, 'Cascading Style Sheet', 'Skyline\HTML\Head\LinkCSS', 'text/css', 'stylesheet-remote', 'fa-code', 2, 'Cascading Stylesheet source from a css file on a remote server.');
INSERT INTO COMPONENT_ITEM_TYPE (id, caption, className, mimeType, relation, icon, editable, description) VALUES (4, 'Java Script (PRE)', 'Skyline\HTML\Head\RemoteSourceScript', 'application/javascript', 'js-pre', 'fa-terminal', 1, 'Javascript loaded before the page is completed from an existing or uploaded file on your server.');
INSERT INTO COMPONENT_ITEM_TYPE (id, caption, className, mimeType, relation, icon, editable, description) VALUES (5, 'Java Script (PRE)', 'Skyline\HTML\Head\RemoteSourceScript', 'application/javascript', 'js-pre-remote', 'fa-terminal', 2, 'Javascript loaded before the page is completed from a remote server.');

INSERT INTO COMPONENT_ITEM_TYPE (id, caption, className, mimeType, relation, icon, editable, description) VALUES (6, 'Java Script (Post)', 'Skyline\HTML\Head\PostScript', 'application/javascript', 'js-post', 'fa-terminal', 1, 'Javascript loaded after the page is completed from an existing or uploaded file on your server.');
INSERT INTO COMPONENT_ITEM_TYPE (id, caption, className, mimeType, relation, icon, editable, description) VALUES (7, 'Java Script (Post)', 'Skyline\HTML\Head\PostScript', 'application/javascript', 'js-post-remote', 'fa-terminal', 2, 'Javascript loaded after the page is completed from a remote server.');

INSERT INTO COMPONENT_ITEM_TYPE (id, caption, className, mimeType, relation, icon) VALUES (8, 'Icon (ICO)', 'Skyline\HTML\Head\RemoteSourceLink', 'image/vnd.microsoft.icon', 'icon shortcut', 'fa-image');
INSERT INTO COMPONENT_ITEM_TYPE (id, caption, className, mimeType, relation, icon) VALUES (9, 'Icon (PNG)', 'Skyline\HTML\Head\RemoteSourceLink', 'image/png', 'icon shortcut', 'fa-image');
INSERT INTO COMPONENT_ITEM_TYPE (id, caption, className, mimeType, relation, icon) VALUES (10, 'Icon (JPG)', 'Skyline\HTML\Head\RemoteSourceLink', 'image/jpg', 'icon shortcut', 'fa-image');
INSERT INTO COMPONENT_ITEM_TYPE (id, caption, className, mimeType, relation, icon) VALUES (11, 'Icon (JPEG)', 'Skyline\HTML\Head\RemoteSourceLink', 'image/jpeg', 'icon shortcut', 'fa-image');

INSERT INTO COMPONENT_ITEM_TYPE (id, caption, className, mimeType, relation, icon, editable, description) VALUES (12, 'Icon', 'Skyline\HTML\Head\RemoteSourceLink', 'image/*', 'icon shortcut', 'fa-image', 1, 'Page icon from an existing or uploaded file on your server.');
INSERT INTO COMPONENT_ITEM_TYPE (id, caption, className, mimeType, relation, icon, editable, description) VALUES (13, 'Icon', 'Skyline\HTML\Head\RemoteSourceLink', 'image/*', 'icon shortcut-remote', 'fa-image', 2, 'Page icon from a remote server.');