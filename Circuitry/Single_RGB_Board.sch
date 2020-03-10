<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.5.1">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="14" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="Wurth_Elektronik_Optoelectronics_rev15b">
<description>&lt;BR&gt;Würth Elektronik --Signal LEDs,White LEDs&lt;br&gt;&lt;Hr&gt;
&lt;BR&gt;&lt;BR&gt; 
&lt;TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0&gt;
&lt;TR&gt;   
&lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;&lt;BR&gt;&lt;br&gt;
      &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&lt;BR&gt;
       &lt;BR&gt;
       &lt;BR&gt;
       &lt;BR&gt;&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
&lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;&lt;br&gt;
      -----&lt;BR&gt;
      -----&lt;BR&gt;
      -----&lt;BR&gt;
      -----&lt;BR&gt;
      -----&lt;BR&gt;&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt; &lt;FONT FACE=ARIAL SIZE=3&gt;&lt;br&gt;
      ---------------------------&lt;BR&gt;
&lt;B&gt;&lt;I&gt;&lt;span style='font-size:26pt;
  color:#FF6600;'&gt;WE &lt;/span&gt;&lt;/i&gt;&lt;/b&gt;
&lt;BR&gt;
      ---------------------------&lt;BR&gt;&lt;b&gt;Würth Elektronik&lt;/b&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;&lt;br&gt;
      ---------O---&lt;BR&gt;
      ----O--------&lt;BR&gt;
      ---------O---&lt;BR&gt;
      ----O--------&lt;BR&gt;
      ---------O---&lt;BR&gt;&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
   
&lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;&lt;BR&gt;
      &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;&lt;BR&gt;
       &lt;BR&gt;
       &lt;BR&gt;
       &lt;BR&gt;
       &lt;BR&gt;&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;

  &lt;TR&gt;
    &lt;TD COLSPAN=7&gt;&amp;nbsp;
    &lt;/TD&gt;
  &lt;/TR&gt;
  
&lt;/TABLE&gt;
&lt;B&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;More than you expect&lt;BR&gt;&lt;BR&gt;&lt;BR&gt;&lt;/B&gt;

&lt;HR&gt;&lt;BR&gt;
&lt;b&gt;Würth Elektronik eiSos GmbH &amp; Co. KG&lt;/b&gt;&lt;br&gt;
EMC &amp; Inductive Solutions&lt;br&gt;

Max-Eyth-Str.1&lt;br&gt;
D-74638 Waldenburg&lt;br&gt;
&lt;br&gt;
Tel: +49 (0)7942-945-0&lt;br&gt;
Fax:+49 (0)7942-945-405&lt;br&gt;
&lt;br&gt;
&lt;a href="http://www.we-online.com/eagle"&gt;http://www.we-online.com/eagle&lt;/a&gt;&lt;br&gt;
&lt;a href="mailto:libraries@we-online.com"&gt;libraries@we-online.com&lt;/a&gt; &lt;BR&gt;&lt;BR&gt;
&lt;br&gt;&lt;HR&gt;&lt;BR&gt;
Neither CadSoft nor WE-eiSos does warrant that this library is error-free or &lt;br&gt;
that it meets your specific requirements.&lt;br&gt;&lt;BR&gt;
Please contact us for more information.&lt;br&gt;&lt;BR&gt;&lt;br&gt;
&lt;hr&gt;
Eagle Version 6, Library Revision 2015b, 08.04.2015&lt;br&gt;
&lt;HR&gt;
Copyright: Würth Elektronik</description>
<packages>
<package name="3528-COMMON-ANODE">
<wire x1="-2.6" y1="1.6" x2="2.6" y2="1.6" width="0.127" layer="39"/>
<wire x1="2.6" y1="1.6" x2="2.6" y2="-1.6" width="0.127" layer="39"/>
<wire x1="2.6" y1="-1.6" x2="-2.6" y2="-1.6" width="0.127" layer="39"/>
<wire x1="-2.6" y1="-1.6" x2="-2.6" y2="1.6" width="0.127" layer="39"/>
<wire x1="-1.75" y1="1.4" x2="1.75" y2="1.4" width="0.127" layer="51"/>
<wire x1="1.75" y1="1.4" x2="1.75" y2="-1.4" width="0.127" layer="51"/>
<wire x1="1.75" y1="-1.4" x2="-1.75" y2="-1.4" width="0.127" layer="51"/>
<wire x1="-1.75" y1="-1.4" x2="-1.75" y2="1.4" width="0.127" layer="51"/>
<smd name="3" x="-1.55" y="0.85" dx="1.5" dy="0.9" layer="1" rot="R180"/>
<smd name="1" x="1.55" y="0.85" dx="1.5" dy="0.9" layer="1" rot="R180"/>
<smd name="2" x="1.55" y="-0.85" dx="1.5" dy="0.9" layer="1" rot="R180"/>
<smd name="4" x="-1.55" y="-0.85" dx="1.5" dy="0.9" layer="1" rot="R180"/>
<text x="-2.54" y="2.54" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-3.81" size="1.27" layer="27">&gt;VALUE</text>
<text x="-3.6" y="0.5" size="0.8128" layer="21">C</text>
<text x="-3.6" y="-1.3" size="0.8128" layer="21">C</text>
<text x="2.9" y="-1.4" size="0.8128" layer="21">C</text>
<text x="2.9" y="0.4" size="0.8128" layer="21">A</text>
<wire x1="-0.79375" y1="1.5875" x2="-0.8" y2="0.3" width="0.127" layer="43"/>
<wire x1="-0.8" y1="0.3" x2="-2.6" y2="0.3" width="0.127" layer="43"/>
<wire x1="-2.6" y1="0.3" x2="-2.6" y2="-0.3" width="0.127" layer="43"/>
<wire x1="-2.6" y1="-0.3" x2="-0.8" y2="-0.3" width="0.127" layer="43"/>
<wire x1="-0.8" y1="-0.3" x2="-0.79375" y2="-1.5875" width="0.127" layer="43"/>
<wire x1="-0.79375" y1="-1.5875" x2="0.79375" y2="-1.5875" width="0.127" layer="43"/>
<wire x1="0.79375" y1="-1.5875" x2="0.8" y2="-0.3" width="0.127" layer="43"/>
<wire x1="0.8" y1="-0.3" x2="2.6" y2="-0.3" width="0.127" layer="43"/>
<wire x1="2.6" y1="-0.3" x2="2.6" y2="0.3" width="0.127" layer="43"/>
<wire x1="2.6" y1="0.3" x2="0.8" y2="0.3" width="0.127" layer="43"/>
<wire x1="0.8" y1="0.3" x2="0.79375" y2="1.5875" width="0.127" layer="43"/>
<wire x1="0.79375" y1="1.5875" x2="-0.79375" y2="1.5875" width="0.127" layer="43"/>
<wire x1="-1.75" y1="1.4" x2="1.75" y2="1.4" width="0.127" layer="21"/>
<wire x1="-1.75" y1="-1.4" x2="1.75" y2="-1.4" width="0.127" layer="21"/>
<wire x1="-1.75" y1="0.3" x2="-1.75" y2="-0.3" width="0.127" layer="21"/>
<wire x1="1.75" y1="0.3" x2="1.75" y2="-0.3" width="0.127" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="WL-SBTW">
<description>3 LED with common Anode</description>
<wire x1="4.23" y1="-9" x2="5.73" y2="-9" width="0.254" layer="94"/>
<wire x1="-2.54" y1="2.54" x2="-2.54" y2="0" width="0.254" layer="94"/>
<wire x1="-2.54" y1="0" x2="-2.54" y2="-2.54" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-2.54" x2="2.54" y2="0" width="0.254" layer="94"/>
<wire x1="2.54" y1="0" x2="-2.54" y2="2.54" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-5.08" x2="-2.54" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-7.62" x2="-2.54" y2="-10.16" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-10.16" x2="2.54" y2="-7.62" width="0.254" layer="94"/>
<wire x1="2.54" y1="-7.62" x2="-2.54" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-2.54" y1="10.16" x2="-2.54" y2="7.62" width="0.254" layer="94"/>
<wire x1="-2.54" y1="7.62" x2="-2.54" y2="5.08" width="0.254" layer="94"/>
<wire x1="-2.54" y1="5.08" x2="2.54" y2="7.62" width="0.254" layer="94"/>
<wire x1="2.54" y1="7.62" x2="-2.54" y2="10.16" width="0.254" layer="94"/>
<wire x1="-2.54" y1="7.62" x2="-7.62" y2="7.62" width="0.254" layer="94"/>
<wire x1="-7.62" y1="7.62" x2="-7.62" y2="0" width="0.254" layer="94"/>
<wire x1="-7.62" y1="0" x2="-7.62" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-7.62" x2="-2.54" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-2.54" y1="0" x2="-7.62" y2="0" width="0.254" layer="94"/>
<wire x1="-2.54" y1="0" x2="2.54" y2="0" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-7.62" x2="2.54" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-2.54" y1="7.62" x2="2.54" y2="7.62" width="0.254" layer="94"/>
<wire x1="2.54" y1="2.54" x2="2.54" y2="-2.54" width="0.254" layer="94"/>
<wire x1="2.54" y1="-5.08" x2="2.54" y2="-10.16" width="0.254" layer="94"/>
<wire x1="2.54" y1="10.16" x2="2.54" y2="5.08" width="0.254" layer="94"/>
<wire x1="4.23" y1="-1.4" x2="5.73" y2="-1.4" width="0.254" layer="94"/>
<wire x1="4.33" y1="6.4" x2="5.83" y2="6.4" width="0.254" layer="94"/>
<wire x1="-12.38" y1="-2.87" x2="-10.88" y2="-2.87" width="0.254" layer="94"/>
<wire x1="-11.61" y1="-3.64" x2="-11.61" y2="-2.14" width="0.254" layer="94"/>
<text x="-3.69" y="11.842" size="1.27" layer="95">&gt;NAME</text>
<text x="-3.69" y="-13.968" size="1.27" layer="96">&gt;VALUE</text>
<text x="0.6" y="4.9" size="1.27" layer="94">G</text>
<text x="0.7" y="-3" size="1.27" layer="94">R</text>
<text x="0.8" y="-10.5" size="1.27" layer="94">B</text>
<pin name="A" x="-10.16" y="0" length="short"/>
<pin name="BC" x="5.08" y="-7.62" length="short" rot="R180"/>
<pin name="RC" x="5.08" y="0" length="short" rot="R180"/>
<pin name="GC" x="5.08" y="7.62" length="short" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="WL-SFTW" prefix="D">
<description>&lt;b&gt;SMD full-color TOP LED
&lt;br&gt;
&lt;br&gt;
&lt;br&gt;&lt;b&gt; Characteristics
&lt;br&gt;
&lt;br&gt;&lt;/b&gt;&lt;/b&gt; Low energy consumption
&lt;br&gt; High reliability
&lt;br&gt; Low current requirement
&lt;br&gt; Fast switching
&lt;br&gt; No UV/IR radiation
&lt;br&gt; High brightness
&lt;br&gt; RGB individual control
&lt;br&gt; Compact package outline
&lt;br&gt; Black surface
&lt;br&gt;
&lt;br&gt;
&lt;br&gt;&lt;b&gt; Applications
&lt;br&gt;
&lt;br&gt;&lt;/b&gt; Flash light
&lt;br&gt; Switch indicators
&lt;br&gt; Equipments indicators
&lt;br&gt; Accent and decorative lighting
&lt;br&gt; Electronic signage
&lt;br&gt; Video displays
&lt;br&gt; Backlight for LCDs, PDAs and TVs
&lt;br&gt; Oven, microwave
&lt;br&gt; Street lighting
&lt;br&gt; Ideal for lateral coupling in light guides
&lt;br&gt;
&lt;br&gt;
&lt;br&gt;
&lt;br&gt;&lt;a href="http://katalog.we-online.de/media/images/eipal/WL-SFTW_pf2.jpg" title="Enlarge picture"&gt;
&lt;img src="http://katalog.we-online.de/media/thumbs2/eipal/thb_WL-SFTW_pf2.jpg" width="320"&gt;&lt;/a&gt;&lt;p&gt;
Details see: &lt;a href="http://katalog.we-online.de/en/led/WL-SFTW?m"&gt;http://katalog.we-online.de/en/led/WL-SFTW?m&lt;/a&gt;&lt;p&gt;

&lt;/b&gt;Updated   2015-04-10&lt;br&gt;
&lt;/b&gt;2015 (C) Wurth Elektronik</description>
<gates>
<gate name="G$1" symbol="WL-SBTW" x="0" y="0"/>
</gates>
<devices>
<device name="-150141M173100-R&amp;G&amp;B" package="3528-COMMON-ANODE">
<connects>
<connect gate="G$1" pin="A" pad="1"/>
<connect gate="G$1" pin="BC" pad="2"/>
<connect gate="G$1" pin="GC" pad="4"/>
<connect gate="G$1" pin="RC" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="pinhead" urn="urn:adsk.eagle:library:325">
<description>&lt;b&gt;Pin Header Connectors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="1X01" urn="urn:adsk.eagle:footprint:22382/1" library_version="4">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-0.635" y1="1.27" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-0.635" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<pad name="1" x="0" y="0" drill="1.016" shape="octagon"/>
<text x="-1.3462" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.27" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
</package>
</packages>
<packages3d>
<package3d name="1X01" urn="urn:adsk.eagle:package:22485/2" type="model" library_version="4">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="1X01"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="PINHD1" urn="urn:adsk.eagle:symbol:22381/1" library_version="4">
<wire x1="-6.35" y1="-2.54" x2="1.27" y2="-2.54" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="1.27" y2="2.54" width="0.4064" layer="94"/>
<wire x1="1.27" y1="2.54" x2="-6.35" y2="2.54" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="2.54" x2="-6.35" y2="-2.54" width="0.4064" layer="94"/>
<text x="-6.35" y="3.175" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PINHD-1X1" urn="urn:adsk.eagle:component:22540/3" prefix="JP" uservalue="yes" library_version="4">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="PINHD1" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1X01">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22485/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="64" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="D1" library="Wurth_Elektronik_Optoelectronics_rev15b" deviceset="WL-SFTW" device="-150141M173100-R&amp;G&amp;B"/>
<part name="JP1" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-1X1" device="" package3d_urn="urn:adsk.eagle:package:22485/2"/>
<part name="JP2" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-1X1" device="" package3d_urn="urn:adsk.eagle:package:22485/2"/>
<part name="JP3" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-1X1" device="" package3d_urn="urn:adsk.eagle:package:22485/2"/>
<part name="JP4" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-1X1" device="" package3d_urn="urn:adsk.eagle:package:22485/2"/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="D1" gate="G$1" x="53.34" y="50.8" smashed="yes">
<attribute name="NAME" x="49.65" y="62.642" size="1.27" layer="95"/>
<attribute name="VALUE" x="49.65" y="36.832" size="1.27" layer="96"/>
</instance>
<instance part="JP1" gate="G$1" x="33.02" y="58.42" smashed="yes">
<attribute name="NAME" x="26.67" y="61.595" size="1.778" layer="95"/>
<attribute name="VALUE" x="26.67" y="53.34" size="1.778" layer="96"/>
</instance>
<instance part="JP2" gate="G$1" x="33.02" y="50.8" smashed="yes">
<attribute name="NAME" x="26.67" y="53.975" size="1.778" layer="95"/>
<attribute name="VALUE" x="26.67" y="45.72" size="1.778" layer="96"/>
</instance>
<instance part="JP3" gate="G$1" x="81.28" y="58.42" smashed="yes">
<attribute name="NAME" x="74.93" y="61.595" size="1.778" layer="95"/>
<attribute name="VALUE" x="74.93" y="53.34" size="1.778" layer="96"/>
</instance>
<instance part="JP4" gate="G$1" x="81.28" y="50.8" smashed="yes">
<attribute name="NAME" x="74.93" y="53.975" size="1.778" layer="95"/>
<attribute name="VALUE" x="74.93" y="45.72" size="1.778" layer="96"/>
</instance>
</instances>
<busses>
</busses>
<nets>
<net name="N$1" class="0">
<segment>
<pinref part="JP1" gate="G$1" pin="1"/>
<pinref part="D1" gate="G$1" pin="GC"/>
<wire x1="30.48" y1="58.42" x2="58.42" y2="58.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="JP2" gate="G$1" pin="1"/>
<pinref part="D1" gate="G$1" pin="A"/>
<wire x1="30.48" y1="50.8" x2="43.18" y2="50.8" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="D1" gate="G$1" pin="RC"/>
<wire x1="58.42" y1="50.8" x2="66.04" y2="50.8" width="0.1524" layer="91"/>
<wire x1="66.04" y1="50.8" x2="66.04" y2="71.12" width="0.1524" layer="91"/>
<pinref part="JP3" gate="G$1" pin="1"/>
<wire x1="66.04" y1="71.12" x2="78.74" y2="71.12" width="0.1524" layer="91"/>
<wire x1="78.74" y1="71.12" x2="78.74" y2="58.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="JP4" gate="G$1" pin="1"/>
<pinref part="D1" gate="G$1" pin="BC"/>
<wire x1="78.74" y1="50.8" x2="78.74" y2="43.18" width="0.1524" layer="91"/>
<wire x1="78.74" y1="43.18" x2="58.42" y2="43.18" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="8.2" severity="warning">
Since Version 8.2, EAGLE supports online libraries. The ids
of those online libraries will not be understood (or retained)
with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports URNs for individual library
assets (packages, symbols, and devices). The URNs of those assets
will not be understood (or retained) with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports the association of 3D packages
with devices in libraries, schematics, and board files. Those 3D
packages will not be understood (or retained) with this version.
</note>
</compatibility>
</eagle>
