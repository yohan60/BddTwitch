CREATE TABLE support(
   id_support INT,
   names VARCHAR(50) NOT NULL,
   username VARCHAR(50) NOT NULL,
   mail VARCHAR(100),
   supMessage TEXT,
   nbrPhone INT NOT NULL,
   PRIMARY KEY(id_support)
);

CREATE TABLE ads(
   id_ads INT,
   brand VARCHAR(50),
   duration INT,
   nbrAds INT,
   dateStart DATE,
   dateEnd DATE,
   PRIMARY KEY(id_ads)
);

CREATE TABLE twitch_partner(
   id_twitchPartner INT,
   nbrSubA INT,
   nbrFollowersA INT,
   PRIMARY KEY(id_twitchPartner)
);

CREATE TABLE affiliated_partner(
   id_affiliatedPartner INT,
   nbrSubA INT,
   nbrFollowersA INT,
   PRIMARY KEY(id_affiliatedPartner)
);

CREATE TABLE users(
   id_users INT,
   username VARCHAR(50),
   mdp VARCHAR(50),
   dateCreation DATE,
   mail VARCHAR(100),
   birth DATE,
   nbrPhone INT,
   roles VARCHAR(50),
   id_support INT NOT NULL,
   PRIMARY KEY(id_users),
   FOREIGN KEY(id_support) REFERENCES support(id_support)
);

CREATE TABLE follower(
   id_follower INT,
   nbrFollower INT,
   followerTime DATE,
   dateFollower DATE,
   dateFollowerEnd DATE,
   PRIMARY KEY(id_follower)
);

CREATE TABLE following(
   id_following INT,
   nbrFollowing INT,
   dateFollowing DATE,
   PRIMARY KEY(id_following)
);

CREATE TABLE prime_gaming(
   id_primeGaming INT,
   dateActivation DATE,
   id_users INT NOT NULL,
   PRIMARY KEY(id_primeGaming),
   UNIQUE(id_users),
   FOREIGN KEY(id_users) REFERENCES users(id_users)
);

CREATE TABLE gift_card(
   id_giftCard INT,
   numberCode INT,
   rewardGift TEXT,
   PRIMARY KEY(id_giftCard)
);

CREATE TABLE amazon_reward(
   id_amazonReward INT,
   description TEXT,
   dateClaimed DATE,
   id_users INT NOT NULL,
   PRIMARY KEY(id_amazonReward),
   FOREIGN KEY(id_users) REFERENCES users(id_users)
);

CREATE TABLE linked_games_accounts(
   id_linkedGamesAccounts INT,
   platforms VARCHAR(255),
   dateLinked DATE,
   PRIMARY KEY(id_linkedGamesAccounts)
);

CREATE TABLE whisper(
   id_whisper INT,
   msgWhisper TEXT,
   hourWhisper INT,
   dateWhisper DATE,
   id_users INT NOT NULL,
   PRIMARY KEY(id_whisper),
   FOREIGN KEY(id_users) REFERENCES users(id_users)
);

CREATE TABLE friend(
   id_friend INT,
   dateAdded DATE,
   id_users INT NOT NULL,
   PRIMARY KEY(id_friend),
   FOREIGN KEY(id_users) REFERENCES users(id_users)
);

CREATE TABLE my_clips(
   id_myClips INT,
   nameMyClip VARCHAR(100),
   hourMyClip INT,
   dateMyClip DATE,
   urlClip TEXT,
   id_users INT NOT NULL,
   PRIMARY KEY(id_myClips),
   FOREIGN KEY(id_users) REFERENCES users(id_users)
);

CREATE TABLE connection(
   id_connection INT,
   connectedTo VARCHAR(100),
   dateConnection DATE,
   id_users INT,
   PRIMARY KEY(id_connection),
   FOREIGN KEY(id_users) REFERENCES users(id_users)
);

CREATE TABLE wallet(
   id_wallet INT,
   currency DOUBLE,
   chargeWallet DOUBLE,
   dateCharge DATE,
   id_users INT NOT NULL,
   PRIMARY KEY(id_wallet),
   UNIQUE(id_users),
   FOREIGN KEY(id_users) REFERENCES users(id_users)
);

CREATE TABLE bits(
   id_bits INT,
   nbrBits INT,
   price INT,
   dateCharge DATE,
   id_users INT NOT NULL,
   PRIMARY KEY(id_bits),
   FOREIGN KEY(id_users) REFERENCES users(id_users)
);

CREATE TABLE msg_bits(
   id_msgBits INT,
   nbrBits DOUBLE,
   msgBits TEXT,
   dateMsg DATE,
   id_users INT NOT NULL,
   PRIMARY KEY(id_msgBits),
   FOREIGN KEY(id_users) REFERENCES users(id_users)
);

CREATE TABLE sub_categorie(
   id_subCategorie INT,
   subNameCat VARCHAR(100),
   description TEXT,
   dateCreation DATE,
   PRIMARY KEY(id_subCategorie)
);

CREATE TABLE emote_twitch(
   id_emoteTwitch INT,
   nameEmote VARCHAR(100),
   urlEmote TEXT,
   hourMyClip INT,
   dateMyClip DATE,
   PRIMARY KEY(id_emoteTwitch)
);

CREATE TABLE channel(
   id_channel INT,
   nameChannel VARCHAR(100),
   descriptionChannel TEXT,
   urlChannel TEXT,
   viewersCount INT,
   dateCreation DATE,
   id_users INT NOT NULL,
   PRIMARY KEY(id_channel),
   UNIQUE(id_users),
   FOREIGN KEY(id_users) REFERENCES users(id_users)
);

CREATE TABLE stream_chat(
   id_streamChat INT,
   msgStream TEXT,
   dateMsgSent DATE,
   id_channel INT NOT NULL,
   PRIMARY KEY(id_streamChat),
   UNIQUE(id_channel),
   FOREIGN KEY(id_channel) REFERENCES channel(id_channel)
);

CREATE TABLE channel_clips(
   id_channelClips INT,
   chanClip VARCHAR(50),
   urlClip TEXT,
   timeClip INT,
   dateClip DATE,
   PRIMARY KEY(id_channelClips)
);

CREATE TABLE my_emote(
   id_emote INT,
   urlEmote TEXT,
   dateAdded DATE,
   nameEmote VARCHAR(50),
   imgEmote INT,
   id_users INT NOT NULL,
   PRIMARY KEY(id_emote),
   FOREIGN KEY(id_users) REFERENCES users(id_users)
);

CREATE TABLE badge(
   id_badge INT,
   levelBadge INT,
   imgBadge INT,
   timeBadge INT,
   PRIMARY KEY(id_badge)
);

CREATE TABLE streams(
   id_streams INT,
   titre VARCHAR(255),
   description TEXT,
   nbrViewers INT,
   nbrView INT,
   duration INT,
   dateStart DATE,
   dateEnd DATE NOT NULL,
   id_channel INT NOT NULL,
   PRIMARY KEY(id_streams),
   FOREIGN KEY(id_channel) REFERENCES channel(id_channel)
);

CREATE TABLE all_vids(
   id_allVids INT,
   nameVid TEXT,
   timeVid INT,
   dateVid DATE,
   totalView INT,
   urlVid TEXT,
   id_streams INT NOT NULL,
   PRIMARY KEY(id_allVids),
   FOREIGN KEY(id_streams) REFERENCES streams(id_streams)
);

CREATE TABLE highlight(
   id_highlight INT,
   nameHighlight VARCHAR(255),
   timeHighlight INT,
   dateHighlight DATE,
   totalView INT,
   urlHighlight TEXT,
   id_allVids INT NOT NULL,
   PRIMARY KEY(id_highlight),
   FOREIGN KEY(id_allVids) REFERENCES all_vids(id_allVids)
);

CREATE TABLE clip(
   id_clips INT,
   nameClip VARCHAR(255),
   timeClip INT,
   dateClip DATE,
   totalView INT,
   urlClip TEXT,
   id_allVids INT NOT NULL,
   PRIMARY KEY(id_clips),
   FOREIGN KEY(id_allVids) REFERENCES all_vids(id_allVids)
);

CREATE TABLE collection(
   id_collection INT,
   descriptionCollection TEXT,
   dateCreation DATE,
   nameCollection VARCHAR(255),
   id_allVids INT NOT NULL,
   PRIMARY KEY(id_collection),
   FOREIGN KEY(id_allVids) REFERENCES all_vids(id_allVids)
);

CREATE TABLE inventory(
   id_inventory INT,
   nameInv VARCHAR(255),
   dateAcquired DATE,
   dateClaimed DATE,
   id_users INT NOT NULL,
   PRIMARY KEY(id_inventory),
   UNIQUE(id_users),
   FOREIGN KEY(id_users) REFERENCES users(id_users)
);

CREATE TABLE campaign(
   id_campaign INT,
   nameCamp VARCHAR(100),
   itemCamp VARCHAR(150),
   timeCamp DATE,
   id_users INT NOT NULL,
   PRIMARY KEY(id_campaign),
   FOREIGN KEY(id_users) REFERENCES users(id_users)
);

CREATE TABLE extension(
   id_extension INT,
   nameExtension VARCHAR(255),
   typeExtension VARCHAR(50),
   dateAdded DATE,
   PRIMARY KEY(id_extension)
);

CREATE TABLE statistics(
   id_statistics INT,
   categoriesStream VARCHAR(50),
   nbrViewers INT,
   nbrViews INT,
   nbrClips INT,
   nbrMsg INT,
   dateMade DATE,
   timeStream INT,
   id_users INT NOT NULL,
   PRIMARY KEY(id_statistics),
   FOREIGN KEY(id_users) REFERENCES users(id_users)
);

CREATE TABLE blocklist(
   id_blockList INT,
   reasonBlock TEXT,
   dateBl DATE,
   id_users INT NOT NULL,
   PRIMARY KEY(id_blockList),
   FOREIGN KEY(id_users) REFERENCES users(id_users)
);

CREATE TABLE signaler(
   id_signaler INT,
   reasonReport TEXT,
   dateReport DATE,
   id_users INT NOT NULL,
   PRIMARY KEY(id_signaler),
   FOREIGN KEY(id_users) REFERENCES users(id_users)
);

CREATE TABLE notification(
   id_notification INT,
   descriptionNotif TEXT,
   dateNotif DATE,
   PRIMARY KEY(id_notification)
);

CREATE TABLE sub(
   id_sub INT,
   nbrSubs INT,
   level INT,
   price DOUBLE,
   typeSub VARCHAR(50),
   totalTime INT,
   id_channel INT NOT NULL,
   id_users INT NOT NULL,
   PRIMARY KEY(id_sub),
   FOREIGN KEY(id_channel) REFERENCES channel(id_channel),
   FOREIGN KEY(id_users) REFERENCES users(id_users)
);

CREATE TABLE transaction(
   id_transaction INT,
   detailTransaction TEXT,
   priceTransaction INT,
   dateTransaction DATE,
   id_users INT NOT NULL,
   PRIMARY KEY(id_transaction),
   FOREIGN KEY(id_users) REFERENCES users(id_users)
);

CREATE TABLE ticket(
   id_ticket INT,
   description TEXT NOT NULL,
   typeTicket VARCHAR(255) NOT NULL,
   statusTicket VARCHAR(50) NOT NULL,
   date_Creation DATETIME NOT NULL,
   date_Fin DATETIME NOT NULL,
   id_users INT NOT NULL,
   PRIMARY KEY(id_ticket),
   FOREIGN KEY(id_users) REFERENCES users(id_users)
);

CREATE TABLE live_channel(
   id_liveChannel INT,
   id_notification INT NOT NULL,
   id_channel INT NOT NULL,
   PRIMARY KEY(id_liveChannel),
   UNIQUE(id_channel),
   FOREIGN KEY(id_notification) REFERENCES notification(id_notification),
   FOREIGN KEY(id_channel) REFERENCES channel(id_channel)
);

CREATE TABLE past_stream(
   id_pastStream INT,
   nameStream VARCHAR(255),
   timeStream INT,
   dateStream DATE,
   totalView INT,
   urlReplay TEXT,
   id_allVids INT NOT NULL,
   PRIMARY KEY(id_pastStream),
   FOREIGN KEY(id_allVids) REFERENCES all_vids(id_allVids)
);

CREATE TABLE categorie(
   id_categorie INT,
   nomCategorie VARCHAR(100),
   descriptionCategorie TEXT,
   dateCreation DATE,
   id_liveChannel INT,
   PRIMARY KEY(id_categorie),
   FOREIGN KEY(id_liveChannel) REFERENCES live_channel(id_liveChannel)
);

CREATE TABLE twitch_partner_channel(
   id_twitchPartner INT,
   id_channel INT,
   PRIMARY KEY(id_twitchPartner, id_channel),
   FOREIGN KEY(id_twitchPartner) REFERENCES twitch_partner(id_twitchPartner),
   FOREIGN KEY(id_channel) REFERENCES channel(id_channel)
);

CREATE TABLE affiliated_partner_channel(
   id_affiliatedPartner INT,
   id_channel INT,
   PRIMARY KEY(id_affiliatedPartner, id_channel),
   FOREIGN KEY(id_affiliatedPartner) REFERENCES affiliated_partner(id_affiliatedPartner),
   FOREIGN KEY(id_channel) REFERENCES channel(id_channel)
);

CREATE TABLE following_channel(
   id_following INT,
   id_channel INT,
   PRIMARY KEY(id_following, id_channel),
   FOREIGN KEY(id_following) REFERENCES following(id_following),
   FOREIGN KEY(id_channel) REFERENCES channel(id_channel)
);

CREATE TABLE follower_channel(
   id_follower INT,
   id_channel INT,
   PRIMARY KEY(id_follower, id_channel),
   FOREIGN KEY(id_follower) REFERENCES follower(id_follower),
   FOREIGN KEY(id_channel) REFERENCES channel(id_channel)
);

CREATE TABLE users_gift_cards(
   id_users INT,
   id_giftCard INT,
   PRIMARY KEY(id_users, id_giftCard),
   FOREIGN KEY(id_users) REFERENCES users(id_users),
   FOREIGN KEY(id_giftCard) REFERENCES gift_card(id_giftCard)
);

CREATE TABLE linked_games_users(
   id_linkedGamesAccounts INT,
   id_users INT,
   PRIMARY KEY(id_linkedGamesAccounts, id_users),
   FOREIGN KEY(id_linkedGamesAccounts) REFERENCES linked_games_accounts(id_linkedGamesAccounts),
   FOREIGN KEY(id_users) REFERENCES users(id_users)
);

CREATE TABLE clips_chan(
   id_channel INT,
   id_channelClips INT,
   PRIMARY KEY(id_channel, id_channelClips),
   FOREIGN KEY(id_channel) REFERENCES channel(id_channel),
   FOREIGN KEY(id_channelClips) REFERENCES channel_clips(id_channelClips)
);

CREATE TABLE sub_categorie_channel(
   id_subCategorie INT,
   id_liveChannel INT,
   PRIMARY KEY(id_subCategorie, id_liveChannel),
   FOREIGN KEY(id_subCategorie) REFERENCES sub_categorie(id_subCategorie),
   FOREIGN KEY(id_liveChannel) REFERENCES live_channel(id_liveChannel)
);

CREATE TABLE ajouter_emote(
   id_emoteTwitch INT,
   id_channel INT,
   PRIMARY KEY(id_emoteTwitch, id_channel),
   FOREIGN KEY(id_emoteTwitch) REFERENCES emote_twitch(id_emoteTwitch),
   FOREIGN KEY(id_channel) REFERENCES channel(id_channel)
);

CREATE TABLE badge_users(
   id_badge INT,
   id_users INT,
   PRIMARY KEY(id_badge, id_users),
   FOREIGN KEY(id_badge) REFERENCES badge(id_badge),
   FOREIGN KEY(id_users) REFERENCES users(id_users)
);

CREATE TABLE ads_users(
   id_ads INT,
   id_users INT,
   PRIMARY KEY(id_ads, id_users),
   FOREIGN KEY(id_ads) REFERENCES ads(id_ads),
   FOREIGN KEY(id_users) REFERENCES users(id_users)
);

CREATE TABLE channel_extension(
   id_channel INT,
   id_extension INT,
   PRIMARY KEY(id_channel, id_extension),
   FOREIGN KEY(id_channel) REFERENCES channel(id_channel),
   FOREIGN KEY(id_extension) REFERENCES extension(id_extension)
);