<?php
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

namespace Skyline\Admin\PDO;


use TASoft\Util\PDO;

class AbstractInstaller implements TableInstallerInterface, TableUninstallerInterface
{
	const SUCCESS = 0;
	const FAILED = -10;

	const TABLE_NOT_FOUND = -1;
	const DOMAIN_NOT_FOUND = -2;
	const ROOT_NOT_FOUND = -3;



	protected static $tableNames = [
		//  "domain" => ['table1', 'table2', ...]
	];

	public static function canInit(PDO $PDO): bool {
		$ds = DIRECTORY_SEPARATOR;
		$root = dirname(__DIR__) . "{$ds}SQL$ds";

		if(!is_dir($root))
			return false;

		foreach(array_keys(static::$tableNames) as $domain) {
			$dir = $root;
			if($domain)
				$dir .= "$domain$ds" . strtolower( $PDO->getAttribute( PDO::ATTR_DRIVER_NAME ) ) . "{$ds}c";
			if(!is_dir($dir))
				return false;
		}
		return true;
	}

	/**
	 * @inheritDoc
	 */
	public static function init(PDO $PDO): int
	{
		$ds = DIRECTORY_SEPARATOR;
		$root = dirname(__DIR__) . "{$ds}SQL$ds";

		if(!is_dir($root))
			return static::ROOT_NOT_FOUND;

		foreach(static::$tableNames as $domain => $tables) {
			$dir = $root;

			if($domain)
				$dir .= "$domain$ds";

			if(!is_dir($dir))
				return self::DOMAIN_NOT_FOUND;

			foreach($tables as $tableName) {
				$table = "$dir$ds" . strtolower( $PDO->getAttribute( PDO::ATTR_DRIVER_NAME ) ) . "{$ds}c$ds$tableName.sql";
				if(!is_file($table))
					return static::TABLE_NOT_FOUND;

				$sql = file_get_contents($table);
				try {
					$PDO->exec($sql);
				} catch (\PDOException $exception) {
					return static::FAILED;
				}
			}
		}
		return static::SUCCESS;
	}

	public static function drop(PDO $PDO): int
	{
		$ds = DIRECTORY_SEPARATOR;
		$root = dirname(__DIR__) . "{$ds}SQL$ds";

		if(!is_dir($root))
			return static::ROOT_NOT_FOUND;

		foreach(static::$tableNames as $domain => $tables) {
			$dir = $root;

			if($domain)
				$dir .= "$domain$ds";

			if(!is_dir($dir))
				return self::DOMAIN_NOT_FOUND;

			foreach($tables as $tableName) {
				$table = "$dir$ds" . strtolower( $PDO->getAttribute( PDO::ATTR_DRIVER_NAME ) ) . "{$ds}d$ds$tableName.sql";
				if(!is_file($table))
					return static::TABLE_NOT_FOUND;

				$sql = file_get_contents($table);
				try {
					$PDO->exec($sql);
				} catch (\PDOException $exception) {
					return static::FAILED;
				}
			}
		}
		return static::SUCCESS;
	}
}