<div class="users">

<!-- IF breadcrumbs.length -->
<ol class="breadcrumb">
	<!-- BEGIN breadcrumbs -->
	<li<!-- IF @last --> component="breadcrumb/current"<!-- ENDIF @last --> itemscope="itemscope" itemtype="http://data-vocabulary.org/Breadcrumb" <!-- IF @last -->class="active"<!-- ENDIF @last -->>
		<!-- IF !@last --><a href="{breadcrumbs.url}" itemprop="url"><!-- ENDIF !@last -->
			<span itemprop="title">
				{breadcrumbs.text}
				<!-- IF @last -->
				<!-- IF !feeds:disableRSS -->
				<!-- IF rssFeedUrl --><a target="_blank" href="{rssFeedUrl}"><i class="fa fa-rss-square"></i></a><!-- ENDIF rssFeedUrl --><!-- ENDIF !feeds:disableRSS -->
				<!-- ENDIF @last -->
			</span>
		<!-- IF !@last --></a><!-- ENDIF !@last -->
	</li>
	<!-- END breadcrumbs -->
</ol>
<!-- ENDIF breadcrumbs.length -->

<ul class="nav nav-pills">
	<li><a href='{config.relative_path}/users/online'>[[global:online]]</a></li>
	<li><a href='{config.relative_path}/users/sort-posts'>[[users:top_posters]]</a></li>
	<!-- IF !reputation:disabled -->
	<li><a href='{config.relative_path}/users/sort-reputation'>[[users:most_reputation]]</a></li>
	<!-- ENDIF !reputation:disabled -->
	<!-- IF function.displayUserSearch, {config.allowGuestUserSearching} -->
	<li><a href='{config.relative_path}/users/search'>[[users:search]]</a></li>
	<!-- ENDIF function.displayUserSearch -->
	<!-- IF inviteOnly -->
	<!-- IF loggedIn -->
	<button component="user/invite" class="btn btn-success pull-right"><i class="fa fa-users"></i> [[users:invite]]</button>
	<!-- ENDIF loggedIn -->
	<!-- ENDIF inviteOnly -->
</ul>

	<br />

	<div class="search {search_display}">
		<div class="input-group">
			<input class="form-control" id="search-user" type="text" placeholder="[[users:enter_username]]"/>
			<span class="input-group-addon">
				<span id="user-notfound-notify"><i class="fa fa-search"></i></span>
			</span>
		</div>
	</div>

	<ul id="users-container" class="users-container">
<!-- BEGIN users -->
<li class="users-box registered-user" data-uid="{users.uid}">
	<a href="{config.relative_path}/user/{users.userslug}">
		<!-- IF users.picture -->
		<img src="{users.picture}" />
		<!-- ELSE -->
		<div class="user-icon" style="background-color: {users.icon:bgColor};">{users.icon:text}</div>
		<!-- ENDIF users.picture -->
	</a>
	<br/>
	<div class="user-info">
		<span>
			<i component="user/status" class="fa fa-circle status {users.status}" title="[[global:{users.status}]]"></i>
			<a href="{config.relative_path}/user/{users.userslug}">{users.username}</a>
		</span>
		<br/>

		<!-- IF route_users:joindate -->
		<div title="joindate" class="joindate">
			<i class='fa fa-clock'></i>
			<span class='timeago' title="{users.joindateISO}"></span>
		</div>
		<!-- ENDIF route_users:joindate -->

		<!-- IF route_users:reputation -->
		<div title="reputation" class="reputation">
			<i class='fa fa-star'></i>
			<span class='formatted-number'>{users.reputation}</span>
		</div>
		<!-- ENDIF route_users:reputation -->

		<!-- IF route_users:postcount -->
		<div title="post count" class="post-count">
			<i class='fa fa-pencil'></i>
			<span class='formatted-number'>{users.postcount}</span>
		</div>
		<!-- ENDIF route_users:postcount -->
	</div>
</li>
<!-- END users -->
		<!-- IF anonymousUserCount -->
		<li class="users-box anon-user">
			<div class="user-icon">G</div>
			<br/>
			<div class="user-info">
				<span id="online_anon_count">{anonymousUserCount}</span>
				<span>[[global:guests]]</span>
			</div>
		</li>
		<!-- ENDIF anonymousUserCount -->
	</ul>

	<div class="text-center {loadmore_display}">
		<button id="load-more-users-btn" class="btn btn-primary">[[users:load_more]]</button>
	</div>
</div>
