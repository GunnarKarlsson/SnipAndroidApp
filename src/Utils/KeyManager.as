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
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	import spark.managers.PersistenceManager;

	public class KeyManager extends EventDispatcher
	{
		public function KeyManager(target:IEventDispatcher=null)
		{
			super(target);
		}

		public static function setKey(value:String):void
		{

			var p:PersistenceManager=new PersistenceManager();
			var obj:Object=new Object();
			obj.data=value;
			obj.isValid="true";
			p.setProperty("apiKey", obj);

		}

		public static function getKey():String
		{
			var p:PersistenceManager=new PersistenceManager();
			var obj:Object=p.getProperty("apiKey");

			if (obj)
			{
				return obj.data;
			}
			else
			{
				return null;
			}
		}

		public static function isValid():String
		{
			var p:PersistenceManager=new PersistenceManager();
			var obj:Object=p.getProperty("apiKey");

			if (obj)
			{
				return obj.isValid;
			}
			else
			{
				return null;
			}
		}


	}
}
