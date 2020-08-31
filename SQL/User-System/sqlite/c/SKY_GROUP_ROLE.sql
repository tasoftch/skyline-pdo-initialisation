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

CREATE TABLE IF NOT EXISTS SKY_GROUP_ROLE (
                                              groupid INTEGER not null ,
                                              role INTEGER not null
);

/* ADMINISTRATOR */
INSERT INTO SKY_GROUP_ROLE (groupid, role) VALUES (1, 2); /* SKYLINE.ADMIN */
INSERT INTO SKY_GROUP_ROLE (groupid, role) VALUES (1, 3); /* SKYLINE.CONTENTS */
INSERT INTO SKY_GROUP_ROLE (groupid, role) VALUES (1, 10); /* SKYLINE.GROUPS */
INSERT INTO SKY_GROUP_ROLE (groupid, role) VALUES (1, 20); /* SKYLINE.ROLES */
INSERT INTO SKY_GROUP_ROLE (groupid, role) VALUES (1, 30); /* SKYLINE.USERS */
INSERT INTO SKY_GROUP_ROLE (groupid, role) VALUES (1, 40); /* SKYLINE.CONTENTS.MEDIA */

/* AUTHOR */
INSERT INTO SKY_GROUP_ROLE (groupid, role) VALUES (2, 2); /* SKYLINE.ADMIN */
INSERT INTO SKY_GROUP_ROLE (groupid, role) VALUES (2, 3); /* SKYLINE.CONTENTS */

/* TRANSLATOR */
INSERT INTO SKY_GROUP_ROLE (groupid, role) VALUES (3, 2); /* SKYLINE.ADMIN */
INSERT INTO SKY_GROUP_ROLE (groupid, role) VALUES (3, 6); /* SKYLINE.CONTENTS.EDIT.TRANSLATE */