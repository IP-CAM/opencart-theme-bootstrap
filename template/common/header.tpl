<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">

<head>

	<meta charset="UTF-8" />

	<title> <?php echo $title; ?> </title>

	<base href="<?php echo $base; ?>" />

	<?php if ($description) { ?>
		<meta name="description" content="<?php echo $description; ?>" />
	<?php } ?>

	<?php if ($keywords) { ?>
		<meta name="keywords" content="<?php echo $keywords; ?>" />
	<?php } ?>

	<?php if ($icon) { ?>
		<link href="<?php echo $icon; ?>" rel="icon" />
	<?php } ?>

	<?php foreach ($links as $link) { ?>
		<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
	<?php } ?>

	<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/assets/css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/assets/css/main.css" />

	<?php foreach ($styles as $style) { ?>
		<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
	<?php } ?>

	<script type="text/javascript" src="catalog/view/theme/default/assets/js/jquery-1.10.2.js"></script>
	<script type="text/javascript" src="catalog/view/theme/default/assets/js/bootstrap.min.js"></script>
	<!--<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
	<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />-->
	<script type="text/javascript" src="catalog/view/javascript/common.js"></script>

	<?php foreach ($scripts as $script) { ?>
		<script type="text/javascript" src="<?php echo $script; ?>"></script>
	<?php } ?>

	<!--[if IE 7]> 
	<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie7.css" />
	<![endif]-->
	<!--[if lt IE 7]>
	<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
	<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
	<script type="text/javascript">
	DD_belatedPNG.fix('#logo img');
	</script>
	<![endif]-->

	<?php if ($stores) { ?>
		<script type="text/javascript">
		<!--
			$(document).ready(function() {

				<?php foreach ($stores as $store) { ?>

					$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');

				<?php } ?>

			});
		//-->
		</script>
	<?php } ?>

	<?php echo $google_analytics; ?>
	
</head>
<body>

	<div class="container">

		<div class="row">
			
			<div class="col-md-3 logo-header">
				
				<?php if ($logo) { ?>

					<a href="<?php echo $home; ?>" title="Navegar até o Início"> <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="col-md-12" /> </a>

				<?php } ?>

			</div> <!-- col-md-3 logo-header -->

			<div class="col-md-6 interative-header">

				<div class="row">
					
					<div class="col-md-4 cart-header">
							
						<?php echo $cart; ?>

					</div>	<!-- col-md-4 cart-header -->


					<div class="col-md-6 search-header">

						<div class="button-search"></div>
						<input type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />

					</div>	<!-- col-md-6 search-header -->

				</div> <!-- row -->


				<div class="row welcome-header">
					
					<?php if (!$logged) { ?>

						<?php echo $text_welcome; ?>

					<?php } else { ?>

						<?php echo $text_logged; ?>

					<?php } ?>

				</div> <!-- row welcome-header -->


				<div class="row util-links-header">
					
					<a href="<?php echo $home; ?>"> <?php echo $text_home; ?> </a>
					<a href="<?php echo $wishlist; ?>" id="wishlist-total"> <?php echo $text_wishlist; ?> </a>
					<a href="<?php echo $account; ?>"> <?php echo $text_account; ?> </a>
					<a href="<?php echo $shopping_cart; ?>"> <?php echo $text_shopping_cart; ?> </a>
					<a href="<?php echo $checkout; ?>"> <?php echo $text_checkout; ?> </a>

				</div> <!-- util-links-header -->

			</div> <!-- col-md-6 interative-header -->

		</div> <!-- row -->


		<div class="row">
			
			<nav class="col-md-12 navbar navbar-default menu-header" role="navigation">

				<div class="container-fluid">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="#"> CTRN </a>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

						<ul class="nav navbar-nav">

							<?php if ($categories) { ?>
					
								<?php foreach ($categories as $category) { ?>

									<!--===
									Na estrutura dos submenus é verificado se o item do menu possui elementos filhos 
									Caso isso aconteça, adiciona a classe dropdown no item do menu principal
									===-->
									<li <?php if ( !empty( $category['children'] ) ) { echo "class='dropdown'"; } ?>>

										<!--===
										Se o item atual do menu possui filhos, adiciona '#' ao link
										===-->
										<a href="<?php if(empty($category['children'])) { echo $category['href']; } else { echo '#'; } ?>" <?php if ( !empty( $category['children'] ) ) { echo "class='dropdown-toggle' data-toggle='dropdown'"; } ?>>
											<?php echo $category['name']; ?>
										</a>

										<!--===
										Se existir elementos filhos (submenus) é feita a iteração para exibi-los
										===-->
										<?php if ($category['children']) { ?>

										<ul class="dropdown-menu">

											<?php for ($i = 0; $i < count($category['children']);) { ?>

												<?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
												<?php for (; $i < $j; $i++) { ?>
												<?php if (isset($category['children'][$i])) { ?>
												<li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
												<?php } ?>
												<?php } ?>

											<?php } ?>

										</ul> <!-- dropdown-menu -->

										<?php } ?>

									</li>

								<?php } ?>

							<?php } ?>

						</ul> <!-- nav navbar-nav -->
						
					</div><!-- /.navbar-collapse -->

				</div><!-- /.container-fluid -->

			</nav> <!-- col-md-12 menu-header -->

		</div> <!-- row -->


		<div class="row">
			
			<?php if ($error) { ?>

				<div class="alert alert-warning warning"> <?php echo $error ?> <img src="catalog/view/theme/default/image/close.png" alt="" class="close" /> </div> <!-- alert alert-warning warning -->

			<?php } ?>

		</div> <!-- row -->

		
		<div class="row">
			
			<!-- <div class="alert alert-warning" id="notification"> </div> --> <!-- alert alert-warning -->

		</div> <!-- row -->