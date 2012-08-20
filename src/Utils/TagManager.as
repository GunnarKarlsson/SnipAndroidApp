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
	import com.squidzoo.eventSystem.EventCentral;
	import com.squidzoo.eventSystem.events.CustomDataEvent;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import mx.collections.ArrayCollection;
	import spark.managers.PersistenceManager;
	import Utils.CustomMultiMap;

	public class TagManager extends EventDispatcher
	{
		private var _map:CustomMultiMap=new CustomMultiMap();

		public function TagManager(target:IEventDispatcher=null)
		{
			super(target);
			EventCentral.getInstance().addEventListener(CustomDataEvent.ADD_TAGS, onAddTags);
		}

		private function onAddTags(event:CustomDataEvent):void
		{
			var allSnippets:ArrayCollection=event.list;
			var thereAreSnippets:Boolean=allSnippets.length > 0;

			if (thereAreSnippets)
			{
				extractTags(allSnippets);
				dispatchTagsToTagView();
			}
		}

		private function extractTags(allSnippets:ArrayCollection):void
		{
			for (var i:int=0; i < allSnippets.length; i++)
			{
				var singleSnippetId:String=allSnippets[i].id;
				var tagListForSingleSnippet:Array=allSnippets[i].tags.split(" ");
				var thereAreTagsForThisSnippet:Boolean=tagListForSingleSnippet.length > 0;

				if (thereAreTagsForThisSnippet)
				{
					insertTagsIntoMap(tagListForSingleSnippet, singleSnippetId);
				}
			}
		}

		private function insertTagsIntoMap(tagListForSingleSnippet:Array, singleSnippetId:String):void
		{
			for (var j:int=0; j < tagListForSingleSnippet.length; j++)
			{
				var singleTag:String=tagListForSingleSnippet[j];
				_map.insertVal(singleTag, singleSnippetId);
			}
		}

		private function dispatchTagsToTagView():void
		{
			var tags:ArrayCollection=new ArrayCollection(_map.getKeys());
			EventCentral.getInstance().dispatchEvent(new CustomDataEvent(CustomDataEvent.TAGS_AVAILABLE, tags));
		}

	}
}
