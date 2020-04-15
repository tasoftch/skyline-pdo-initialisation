/*
 * BSD 3-Clause License
 *
 * Copyright (c) 2020, TASoft Applications
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *  Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 *
 *  Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 *
 *  Neither the name of the copyright holder nor the names of its
 *   contributors may be used to endorse or promote products derived from
 *   this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */

/*
 *   const OPTION_INTERNAL      = 1;
 *   const OPTION_LOGIN_EMAIL   = 8;
 *   const OPTION_INVALIDATE_SESS = 16;
 */

BEGIN TRANSACTION;

CREATE TABLE IF NOT EXISTS SKY_USER
(
    id                int AUTOINCREMENT
        primary key,
    username          varchar(50)            not null,
    credentials       varchar(100)           not null,
    email             varchar(80) default '' not null,
    prename           varchar(50) default '' not null,
    surname           varchar(50) default '' not null,
    options           int         default 8  not null,
    lastLoginDate     datetime               null
);

/*

 THE INITIALISATION SQL NEVER INSERTS A USER DIRECTLY.
 THIS IS DONE AFTER INITIALISATION BY SKYLINE CMS ITSELF.

 */

/*
 *   const OPTION_INTERNAL      = 1;
 */
CREATE TABLE IF NOT EXISTS SKY_GROUP
(
    id          int AUTOINCREMENT
        primary key,
    name        varchar(100)     not null,
    description text            default null,
    options     int    default 0 not null
);

INSERT INTO SKY_GROUP (id, name, description, options) VALUES (1, 'Administrator', 'The administrators of Skyline CMS', 1);
INSERT INTO SKY_GROUP (id, name, description, options) VALUES (2, 'Author', 'Authors can add, edit, translate and delete pages and contents of your website', 1);
INSERT INTO SKY_GROUP (id, name, description, options) VALUES (3, 'Translator', 'Translators can translate existing text into several languages', 1);

UPDATE SQLITE_SEQUENCE SET seq = 50 WHERE name = 'SKY_GROUP';

/*
 *   const OPTION_ASSIGNABLE    = 2;
 *   const OPTION_VISIBLE       = 4;
 *   const OPTION_FINAL         = 8;
 */
CREATE TABLE IF NOT EXISTS SKY_ROLE
(
    id          int AUTO_INCREMENT
        primary key,
    name        varchar(50)      not null,
    description text             default null,
    parent      int              default 0 not null,
    options     int    default 6 not null
);

INSERT INTO SKY_ROLE (id, name, options) VALUES (1, 'SKYLINE', 1);
INSERT INTO SKY_ROLE (id, name, description, parent, options) VALUES (2, 'ADMIN', 'The Administration Privilege. It allows the user to access the Control Panel of Skyline CMS', 1, 1);

/* CONTENTS */
INSERT INTO SKY_ROLE (id, name, description, parent, options) VALUES (3, 'CONTENTS', 'Can manage all contents of the application', 1, 7);
INSERT INTO SKY_ROLE (id, name, description, parent, options) VALUES (4, 'ADD', 'Can add contents', 3, 15);
INSERT INTO SKY_ROLE (id, name, description, parent, options) VALUES (5, 'EDIT', 'Can edit contents', 3, 7);
INSERT INTO SKY_ROLE (id, name, description, parent, options) VALUES (6, 'TRANSLATE', 'Can translate contents', 5, 15);
INSERT INTO SKY_ROLE (id, name, description, parent, options) VALUES (7, 'DELETE', 'Can delete contents', 3, 15);

/* GROUPS */
INSERT INTO SKY_ROLE (id, name, description, parent, options) VALUES (8, 'GROUPS', 'Can manage the groups of the application', 1, 7);
INSERT INTO SKY_ROLE (id, name, description, parent, options) VALUES (9, 'ADD', 'Can add groups', 8, 15);
INSERT INTO SKY_ROLE (id, name, description, parent, options) VALUES (10, 'EDIT', 'Can edit groups', 8, 15);
INSERT INTO SKY_ROLE (id, name, description, parent, options) VALUES (11, 'DELETE', 'Can delete groups', 8, 15);

/* ROLES */
INSERT INTO SKY_ROLE (id, name, description, parent, options) VALUES (12, 'ROLES', 'Can manage the roles of the application', 1, 7);
INSERT INTO SKY_ROLE (id, name, description, parent, options) VALUES (13, 'ADD', 'Can add roles', 12, 15);
INSERT INTO SKY_ROLE (id, name, description, parent, options) VALUES (14, 'EDIT', 'Can edit roles', 12, 15);
INSERT INTO SKY_ROLE (id, name, description, parent, options) VALUES (15, 'DELETE', 'Can delete roles', 12, 15);

/* USERS */
INSERT INTO SKY_ROLE (id, name, description, parent, options) VALUES (16, 'USERS', 'Can manage the users of the application', 1, 7);
INSERT INTO SKY_ROLE (id, name, description, parent, options) VALUES (17, 'ADD', 'Can add users', 16, 15);
INSERT INTO SKY_ROLE (id, name, description, parent, options) VALUES (18, 'EDIT', 'Can edit users properties', 16, 7);
INSERT INTO SKY_ROLE (id, name, description, parent, options) VALUES (19, 'ASSIGN', 'Can assign users to groups', 18, 15);
INSERT INTO SKY_ROLE (id, name, description, parent, options) VALUES (20, 'PRIVILEGE', 'Can assign roles to users directly', 18, 15);
INSERT INTO SKY_ROLE (id, name, description, parent, options) VALUES (21, 'DELETE', 'Can delete users', 16, 15);

/* MEDIA */
INSERT INTO SKY_ROLE (id, name, description, parent, options) VALUES (22, 'MEDIA', 'Can manage the media elements of the application', 3, 7);
INSERT INTO SKY_ROLE (id, name, description, parent, options) VALUES (23, 'ADD', 'Can add media elements', 22, 15);
INSERT INTO SKY_ROLE (id, name, description, parent, options) VALUES (24, 'EDIT', 'Can edit media elements', 22, 15);
INSERT INTO SKY_ROLE (id, name, description, parent, options) VALUES (25, 'DELETE', 'Can delete media elements', 22, 15);


UPDATE SQLITE_SEQUENCE SET seq = 100 WHERE name = 'SKY_ROLE';

CREATE TABLE IF NOT EXISTS SKY_USER_ROLE (
                                             user int not null ,
                                             role int not null
);

CREATE TABLE IF NOT EXISTS SKY_USER_GROUP (
                                              user int not null ,
                                              groupid int not null
);

CREATE TABLE IF NOT EXISTS SKY_GROUP_ROLE (
                                              groupid int not null ,
                                              role int not null
);

/* ASSIGN ROLES TO GROUPS */

/* ADMINISTRATOR */
INSERT INTO SKY_GROUP_ROLE (groupid, role) VALUES (1, 2); /* SKYLINE.ADMIN */
INSERT INTO SKY_GROUP_ROLE (groupid, role) VALUES (1, 3); /* SKYLINE.CONTENTS */
INSERT INTO SKY_GROUP_ROLE (groupid, role) VALUES (1, 8); /*
 * BSD 3-Clause License
 *
 * Copyright (c) 2020, TASoft Applications
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *  Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 *
 *  Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 *
 *  Neither the name of the copyright holder nor the names of its
 *   contributors may be used to endorse or promote products derived from
 *   this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */ /* SKYLINE.GROUPS */
INSERT INTO SKY_GROUP_ROLE (groupid, role) VALUES (1, 12); /* SKYLINE.ROLES */
INSERT INTO SKY_GROUP_ROLE (groupid, role) VALUES (1, 16); /* SKYLINE.USERS */

/* AUTHOR */
INSERT INTO SKY_GROUP_ROLE (groupid, role) VALUES (2, 2); /* SKYLINE.ADMIN */
INSERT INTO SKY_GROUP_ROLE (groupid, role) VALUES (2, 3); /* SKYLINE.CONTENTS */

/* TRANSLATOR */
INSERT INTO SKY_GROUP_ROLE (groupid, role) VALUES (3, 2); /* SKYLINE.ADMIN */
INSERT INTO SKY_GROUP_ROLE (groupid, role) VALUES (3, 6); /* SKYLINE.CONTENTS.EDIT.TRANSLATE */

COMMIT;