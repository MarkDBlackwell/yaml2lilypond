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
<v t="georgesawyer.20110802081402.1951" a="E"><vh>package generate</vh>
<v t="georgesawyer.20110802081402.2005" a="E"><vh>TODO</vh>
<v t="georgesawyer.20110802081402.2007"><vh>chop up with Leo</vh></v>
<v t="georgesawyer.20110802081402.2006" a="E"><vh>add function to find all YAML files.</vh>
<v t="georgesawyer.20110724164426.3527"><vh>look at this for finding yaml files</vh></v>
</v>
</v>
<v t="georgesawyer.20110802081402.1952"><vh>purpose</vh></v>
<v t="georgesawyer.20110802081402.1953" a="E"><vh>external files</vh>
<v t="georgesawyer.20110802081402.1954" a="E"><vh>@path C:\Mark\develop\client\John-Marks\requiem-pro-silens\generate</vh>
<v t="georgesawyer.20110802081402.1955" a="E"
expanded="georgesawyer.20110802081402.2213,georgesawyer.20110802081402.2218,georgesawyer.20110802081402.2219,georgesawyer.20110802081402.2222,georgesawyer.20110802081402.2224,georgesawyer.20110802081402.2227,georgesawyer.20110802081402.2229,georgesawyer.20110802081402.2231,georgesawyer.20110802081402.2239,georgesawyer.20110802081402.2243,georgesawyer.20110802081402.2242,georgesawyer.20110802081402.2253,georgesawyer.20110802081402.2256,georgesawyer.20110802081402.2258,georgesawyer.20110802081402.2261,georgesawyer.20110802081402.2265,georgesawyer.20110802081402.2266,georgesawyer.20110802081402.2268,georgesawyer.20110802081402.2271,"><vh>@shadow generate.rb</vh></v>
</v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="georgesawyer.20110724164426.3527"># Look at this for finding yaml files:
=begin
    app_root
App.root.join(*TEST_GROUP).find do |path|
  b=path.basename.to_s
  Find.prune if path.directory? &amp;&amp; ?.==b[0]
  paths &lt;&lt; path.dirname.join(b.chomp '.rb') if REQUIRE_TEST_BASENAME==b
end
=end</t>
<t tx="georgesawyer.20110802081402.1951"></t>
<t tx="georgesawyer.20110802081402.1952">Improve my use of LilyPond by means of the YAML entry format.
Generate LilyPond input from YAML.</t>
<t tx="georgesawyer.20110802081402.1953"></t>
<t tx="georgesawyer.20110802081402.1954"></t>
<t tx="georgesawyer.20110802081402.2005"></t>
<t tx="georgesawyer.20110802081402.2006"></t>
<t tx="georgesawyer.20110802081402.2007"></t>
</tnodes>
</leo_file>
