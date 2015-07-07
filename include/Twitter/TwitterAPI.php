<?php

require_once( 'twitteroauth.php' );

class TwitterAPI {
	function assignGlobalTPLVars($tpl, $tweetsFrom){
        $tpl->assignGlobal("tweet-user", $tweetsFrom == Twitter::HyperopticCS ? 'HyperopticCS' : "Hyperoptic");
		// Twetter API
		$twitter = new TwitterOAuth(
				'itoDFy9SljVcw47xEYuZFFkyA',
				'bn7T2wZ184cEtYarFcLEdUJmLvsoUpmKx6M4y6tp6Sp1wAXcy8',
				'2364295441-27QoMhXed3yX0WctpW6seAA453UCbxjE2l4GNpC',
				'3aKmoI4I1uGlW4DlY2MAWWlUNG2Eno7IlRvWlz7rY62kW');
		
		$tweets = $twitter->get('statuses/user_timeline',
				array('screen_name' => $tweetsFrom == Twitter::HyperopticCS ? 'HyperopticCS' : "Hyperoptic",
						'exclude_replies' => 'true',
						'include_rts' => 'false',
						'count' => 5)
		);

		if (!empty($tweets)) {
			$tweet = $tweets[0];
		
			$tpl->assignGlobal("tweet-text", replace_links($tweet->text));
			$tpl->assignGlobal("tweet-time", x_time_before($tweet->created_at));
		}
		return $tpl;
	}
}

interface Twitter {
    const Hyperoptic		= 0;
    const HyperopticCS		= 1;
}