/*******************************************************************************
* Copyright 2011, 2012 Gunnar Karlsson.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*******************************************************************************/

package Utils
{

	public class CustomMultiMap
	{
		private var _map:Object=new Object();
		private var _keyList:Array=new Array();

		public function insertVal(key:String, value:String):void
		{
			if (_map[key] == undefined)
			{
				_map[key]=[];
			}
			_map[key].push(value);
			_keyList.push(key);
		}

		public function getKeys():Array
		{
			return _keyList;
		}

		public function getValuesForKey(key:String):Array
		{
			if (_map[key])
			{
				return _map[key];
			}
			else
			{
				return null;
			}
		}
	}
}
