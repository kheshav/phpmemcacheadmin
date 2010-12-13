   <div style="float:left;">
<?php
if((!is_writeable(Library_Configuration_Loader::path())) || (!is_writeable($_ini->get('file_path'))))
{ ?>
        <div class="header corner full-size padding" style="margin-top:18px;text-align:center;">
            Errors are detected !
        </div>
        <div class="container corner padding">
<?php
    if(!is_writeable(Library_Configuration_Loader::path()))
    { ?>
            <strong>You cannot save configuration if this file is unwritable</strong><br/>
            File <?php echo realpath(Library_Configuration_Loader::path()); ?> is in mode
            <?php echo substr(sprintf('%o', fileperms(Library_Configuration_Loader::path())), -4); ?><br/>
            You can manually change permissions of this file or try to fix it by clicking <a class="green" href="configure.php?request_write=unlock">here</a>
<?php
    }
    if(!is_writeable($_ini->get('file_path')))
    { ?>
            <strong>You cannot use Live Stats if this directory is unwritable</strong><br/>
            File <?php echo realpath(Library_Configuration_Loader::path()); ?> is in mode
            <?php echo substr(sprintf('%o', fileperms(Library_Configuration_Loader::path())), -4); ?><br/>
            You can manually change permissions of this file or try to fix it by clicking <a class="green" href="configure.php?request_write=unlock">here</a>
<?php
    } ?>
        </div>
<?php
} ?>
   <div class="size-0" style="float:left;margin-top:18px;">

        <div class="sub-header corner padding">Commands <span class="green">Configuration</span></div>
        <div class="container corner padding" style="padding-right:14px;">
            <form method="post" action="configure.php?request_write=commands">
            <div class="line">
                Memcached commands API used by phpMemCacheAdmin<br/><br/>
                <strong>Recommendations :</strong><br/>
                - Use Server for stats, slabs, items<br/>
                - PECL Memcached does not support the slabs and items commands<br/>
                - If you're using PECL Memcache in your scripts, don't use PECL Memcache, same thing for PECL Memcached<br/>
                - PECL Memcache can't use delay with flush_all<br/>
                <hr/>
            </div>
            <div class="line">
                <span class="left">Stats</span>
                <span class="right"><?php echo Library_HTML_Components::apiList($_ini->get('stats_api'), 'stats_api'); ?></span>
            </div>
            <div class="line">
                <span class="left">Slabs</span>
                <span class="right"><?php echo Library_HTML_Components::apiList($_ini->get('slabs_api'), 'slabs_api'); ?></span>
            </div>
            <div class="line">
                <span class="left">Items</span>
                <span class="right"><?php echo Library_HTML_Components::apiList($_ini->get('items_api'), 'items_api'); ?></span>
            </div>
            <div class="line">
                <span class="left">Get</span>
                <span class="right"><?php echo Library_HTML_Components::apiList($_ini->get('get_api'), 'get_api'); ?></span>
            </div>
            <div class="line">
                <span class="left">Set</span>
                <span class="right"><?php echo Library_HTML_Components::apiList($_ini->get('set_api'), 'set_api'); ?></span>
            </div>
            <div class="line">
                <span class="left">Delete</span>
                <span class="right"><?php echo Library_HTML_Components::apiList($_ini->get('delete_api'), 'delete_api'); ?></span>
            </div>
            <div class="line">
                <span class="left">Flush All</span>
                <span class="right"><?php echo Library_HTML_Components::apiList($_ini->get('flush_all_api'), 'flush_all_api'); ?></span>
            </div>
            <div class="line" style="text-align:center;">
                <hr/>
                <input class="list" type="submit" value="Save API Configuration"/>
            </div>
            </form>
        </div>
        <br/>

        <div class="sub-header corner padding">Live Stats <span class="green">Configuration</span></div>
        <div class="container corner padding" style="padding-right:14px;">
            <form method="post" action="configure.php?request_write=live_stats">
            <div class="line">
                Configuration for Live Stats<br/>
                <hr/>
            </div>
            <div class="line">
                <span class="left">Refresh Rate</span>
                <span class="right"><input type="text" name="refresh_rate" value="<?php echo $_ini->get('refresh_rate'); ?>"/></span>
            </div>
            <div class="line">
                <span class="left">Memory Alert</span>
                <span class="right"><input type="text" name="memory_alert" value="<?php echo $_ini->get('memory_alert'); ?>"/></span>
            </div>
            <div class="line">
                <span class="left">Hit Rate Alert</span>
                <span class="right"><input type="text" name="hit_rate_alert" value="<?php echo $_ini->get('hit_rate_alert'); ?>"/></span>
            </div>
            <div class="line">
                <span class="left">Eviction Alert</span>
                <span class="right"><input type="text" name="eviction_alert" value="<?php echo $_ini->get('eviction_alert'); ?>"/></span>
            </div>
            <div class="line">
                <span class="left">Temp Path</span>
                <span class="right"><input type="text" name="file_path" value="<?php echo $_ini->get('file_path'); ?>"/></span>
            </div>
            <div class="line" style="text-align:center;">
                <hr/>
                <input class="list" type="submit" value="Save Live Configuration"/>
            </div>
            </form>
        </div>
        <br/>

        <div class="sub-header corner padding">Miscellaneous <span class="green">Configuration</span></div>
        <div class="container corner padding" style="padding-right:14px;">
            <form method="post" action="configure.php?request_write=miscellaneous">
            <div class="line">
                Miscellaneous configuration used by phpMemCacheAdmin<br/><br/>
                <strong>Recommendations :</strong><br/>
                - Don't specify a max items too heavy, use get command instead to see a particular key
                <hr/>
            </div>
            <div class="line">
                <span class="left">Timeout</span>
                <span class="right"><input type="text" name="connection_timeout" value="<?php echo $_ini->get('connection_timeout'); ?>"/></span>
            </div>
            <div class="line">
                <span class="left">Max Items</span>
                <span class="right"><input type="text" name="max_item_dump" value="<?php echo $_ini->get('max_item_dump'); ?>"/></span>
            </div>
            <div class="line" style="text-align:center;">
                <hr/>
                <input class="list" type="submit" value="Save API Configuration"/>
            </div>
            </form>
        </div>

    </div>
    <div class="size-0" style="float:left;padding-left:9px;margin-top:18px;">

        <div class="sub-header corner padding">Server <span class="green">List</span></div>
        <div class="container corner padding" style="padding-right:14px;">
            <form method="post" action="configure.php?request_write=servers">
            <div class="line">
                Servers list used by phpMemCacheAdmin<br/><br/>
                <strong>Recommendations :</strong><br/>
                - Use the scheme hostname:port even if port is 11211
                <br/>
                - You can specify multiple instance on different port on same server
            </div>
            <div id="server_form">
<?php
            # Initializing variables
            $server_id = 0;
            $cluster_id = 0;

            # Looking into each cluster
            foreach($_ini->get('servers') as $cluster => $servers)
            {
            $cluster_id++; ?>
            <div id="cluster_<?php echo $cluster_id; ?>">
                <hr/>
                <strong>Cluster <input type="text" style="width:200px;" name="cluster[<?php echo $cluster_id; ?>]" value="<?php echo $cluster; ?>"/></strong>
<?php           # Adding input for each server
                foreach($servers as $server)
                {
                $server_id++; ?>
                <div id="server_<?php echo $server_id; ?>">
                    <div style="margin-left:40px;margin-top:3px;">
                        <input type="text" style="width:200px;" name="server[<?php echo $cluster_id; ?>][<?php echo $server_id; ?>][hostname]" value="<?php echo $server['hostname']; ?>" onfocus="hostnameOnFocus(this)" onblur="hostnameOnBlur(this)"/>
                        <input type="text" style="width:50px;" name="server[<?php echo $cluster_id; ?>][<?php echo $server_id; ?>][port]" value="<?php echo $server['port']; ?>" onfocus="portOnFocus(this)" onblur="portOnBlur(this)"/>
                        <a class="list button" style="padding:1px 2px;" href="#" onclick="deleteServerOrCluster('server_<?php echo $server_id; ?>')">Delete</a>
                    </div>
                </div>
<?php           } ?>
                <div id="cluster_<?php echo $cluster_id; ?>_commands" style="margin-left:40px;margin-top:6px;">
                    <a class="list button" href="javascript:addServer(<?php echo $cluster_id; ?>)">Add New Server to Cluster</a> <a class="list" style="padding:1px 2px;-moz-border-radius:3px;-webkit-border-radius:3px;" href="#" onclick="deleteServerOrCluster('cluster_<?php echo $cluster_id; ?>')">Delete Cluster</a>
                </div>
                <br/>
            </div>
<?php       } ?>
            </div>
            <div class="line">
                <hr/>
                <a class="list button" href="javascript:addCluster()">Add New Cluster</a>
                <input class="list" type="submit" value="Save Servers Configuration"/>
            </div>
            </form>
        </div>
        <script type="text/javascript">
            server_id = <?php echo $server_id; ?>;
            cluster_id = <?php echo $cluster_id; ?>;
        </script>
        <br/>

        <div class="container corner padding">
            <div class="line">
                For more information about configuring phpMemCacheAdmin, see installation guide
                <a href="http://code.google.com/p/phpmemcacheadmin/wiki/InstallationGuide" target="_blank"><span class="green">here</span></a>
            </div>
        </div>
    </div>