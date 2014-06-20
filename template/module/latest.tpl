<div class="row">

	<h2> <?php echo $heading_title; ?> </h2>

	<div class="col-md-12">

	<hr>

	<!--===
	Flag de controle para elemento em destaque
	===-->
	<?php $count = 1; ?>

		<?php foreach ($products as $product) { ?>

			<!--===
			Pega um elemento determinado para exibir de forma destacada na galeria de // Novidades
			===-->
			<?php if ( $count == 3 ) { ?>

				<div class="col-md-3 produto-lancamento text-center">

					<?php if ($product['thumb']) { ?>

						<a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>">
							<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" class="col-md-12" />
						</a>

					<?php } ?>

					<h2> <a href="<?php echo $product['href']; ?>" title="<?php echo 'Navegue até ' . $product['name']; ?>"> <?php echo $product['name']; ?> </a> </h2>

					<?php if ($product['price']) { ?>

						<div class="price">

							<?php if (!$product['special']) { ?>
								<?php echo $product['price']; ?>
							<?php } else { ?>
								<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
							<?php } ?>

						</div>

					<?php } ?>
					
					<?php if ($product['rating']) { ?>
					
						<!--<div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>-->
					
					<?php } ?>
					
					<div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="btn btn-default" /></div>

				</div> <!-- col-md-3 text-center -->


			<!--===
			Caso não seja o elemento em destaque, exibe de forma normal
			===-->
			<?php } else { ?>


				<div class="col-md-3 produto-lancamento text-center">

					<?php if ($product['thumb']) { ?>

						<a href="<?php echo $product['href']; ?>">
							<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" class="col-md-12" />
						</a>

					<?php } ?>

					<h2> <a href="<?php echo $product['href']; ?>" title="<?php echo 'Navegue até ' . $product['name']; ?>"> <?php echo $product['name']; ?> </a> </h2>

					<?php if ($product['price']) { ?>

						<div class="price">

							<?php if (!$product['special']) { ?>
								<?php echo $product['price']; ?>
							<?php } else { ?>
								<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
							<?php } ?>

						</div>

					<?php } ?>
					
					<?php if ($product['rating']) { ?>
					
						<div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
					
					<?php } ?>
					
					<div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="btn btn-default" /></div>

				</div> <!-- col-md-3 text-center -->


			<?php } ?>

			<?php $count++; ?>

		<?php } ?>

	</div> <!-- col-md-12 -->

</div>