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

package VOs
{
	import flash.display.Bitmap;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	[Bindable]
	public class SnippetVO extends EventDispatcher
	{
		[Embed(source="assets/images/smallArrow.png")]
		private var Icon:Class;

		public var irLabel:String="Snippet";
		public var icon:Bitmap=new Icon;
		public var id:String;
		public var user_id:String;
		public var username:String;
		public var title:String;
		public var language:String;
		public var comment:String;
		public var created:String;
		public var source:String;
		public var snipplr_url:String;
		public var tags:String;
	}
}
