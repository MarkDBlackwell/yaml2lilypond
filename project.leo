<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo (http://webpages.charter.net/edreamleo/front.html) -->
<?xml-stylesheet ekr_test?>
<leo_file xmlns:leo="http://www.leo-editor.org/2011/leo" >
<leo_header file_format="2" tnodes="0" max_tnode_index="0" clone_windows="0"/>
<globals body_outline_ratio="0.5" body_secondary_ratio="0.5">
	<global_window_position top="50" left="50" height="500" width="700"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="georgesawyer.20110802081402.1951" a="E"><vh>package yamll2lilypond</vh>
<v t="georgesawyer.20110802081402.1952"><vh>purpose</vh></v>
<v t="georgesawyer.20110802081402.2005" a="E"><vh>TODO</vh>
<v t="georgesawyer.20110819095338.1609"><vh>&lt;&lt; purpose &gt;&gt;</vh></v>
<v t="georgesawyer.20110819095338.1610"><vh>&lt;&lt; usage &gt;&gt;</vh></v>
<v t="georgesawyer.20110802081402.2007"><vh>chop up with Leo</vh></v>
<v t="georgesawyer.20110802081402.2006" a="E"><vh>add function to find all YAML files.</vh>
<v t="georgesawyer.20110819095338.1612"><vh>look at this for finding yaml files</vh></v>
</v>
</v>
<v t="georgesawyer.20110802081402.1953" a="E"><vh>external files</vh>
<v t="georgesawyer.20110802081402.1954" a="E"><vh>@path .</vh>
<v t="markdblackwell.20110823170927.1230" a="E"><vh>@path my_doc</vh>
<v t="georgesawyer.20110819095338.1333" a="E"><vh>@shadow comment_block.txt</vh></v>
</v>
<v t="markdblackwell.20110823170927.1229" a="E"><vh>@path app</vh>
<v t="markdblackwell.20110823170927.1391"><vh>@shadow generate.rb</vh></v>
<v t="markdblackwell.20110823170927.1382"><vh>@shadow app.rb</vh></v>
<v t="markdblackwell.20110823170927.1239"
expanded="markdblackwell.20110823170927.1260,markdblackwell.20110823170927.1261,"><vh>@shadow lily_pond.rb</vh></v>
<v t="markdblackwell.20110823170927.1241"
expanded="markdblackwell.20110823170927.1275,markdblackwell.20110823170927.1277,markdblackwell.20110823170927.1278,"><vh>@shadow main.rb</vh></v>
<v t="markdblackwell.20110823170927.1243"
expanded="markdblackwell.20110823170927.1301,markdblackwell.20110823170927.1308,markdblackwell.20110823170927.1309,"><vh>@shadow measure.rb</vh></v>
<v t="markdblackwell.20110823170927.1354"
expanded="markdblackwell.20110823170927.1366,markdblackwell.20110823170927.1369,markdblackwell.20110823170927.1370,markdblackwell.20110823170927.1372,markdblackwell.20110823170927.1375,"><vh>@shadow movement.rb</vh></v>
<v t="markdblackwell.20110823170927.1245"><vh>@shadow template.rb</vh></v>
<v t="markdblackwell.20110823170927.1247"
expanded="markdblackwell.20110823170927.1336,markdblackwell.20110823170927.1339,markdblackwell.20110823170927.1340,"><vh>@shadow use_yaml.rb</vh></v>
<v t="markdblackwell.20110823170927.1249"
expanded="markdblackwell.20110823170927.1351,"><vh>@shadow variable_request.rb</vh></v>
</v>
</v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="georgesawyer.20110802081402.1951">Convert YAML to LilyPond input format</t>
<t tx="georgesawyer.20110802081402.1952">Improve use of LilyPond by means of the YAML entry format.
Generate LilyPond input from YAML.</t>
<t tx="georgesawyer.20110802081402.1953"></t>
<t tx="georgesawyer.20110802081402.1954"></t>
<t tx="georgesawyer.20110802081402.2005"></t>
<t tx="georgesawyer.20110802081402.2006">=begin
@others
=end</t>
<t tx="georgesawyer.20110802081402.2007"></t>
<t tx="georgesawyer.20110819095338.1609">Purpose: TODO</t>
<t tx="georgesawyer.20110819095338.1610">Example usage: TODO</t>
<t tx="georgesawyer.20110819095338.1612"># Look at this for finding yaml files:
    app_root
App.root.join(*TEST_GROUP).find do |path|
  b=path.basename.to_s
  Find.prune if path.directory? &amp;&amp; ?.==b[0]
  paths &lt;&lt; path.dirname.join(b.chomp '.rb') if REQUIRE_TEST_BASENAME==b
end</t>
<t tx="markdblackwell.20110823170927.1229">@language ruby</t>
<t tx="markdblackwell.20110823170927.1230">@language plain</t>
</tnodes>
</leo_file>
