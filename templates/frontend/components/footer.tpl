	</div><!-- pkp_structure_main -->

  <div class="footer-area">
    <div class="footer-container">
      <div class="footer-resources">
        <div class="footer-resources-inner">
         <h3>
          La Editorial
          </h3>
          <a href="{url router=$smarty.const.ROUTE_PAGE page="about" }">
          <h5>
          Acerca De
          </h5>
          </a>
          <a href="{url router=$smarty.const.ROUTE_PAGE page="about" op="submissions"}">
          <h5>
            Hoja de Ruta
          </h5>
          </a>
          <a href="{url router=$smarty.const.ROUTE_PAGE page="about" op="contact"}">
            <h5>
            Contacto
            </h5>
          </a>
        </div>
      </div>

      <div class="footer-info">
        <div class="footer-info-inner">
          <h5>
            Av. 12 de Abril y Av. Loja
          </h5>
          <h5>
            (593-7) 405 1000 
          </h5>
          <h5>
            Cuenca - Ecuador
          </h5>
        </div>
      </div>

      <div class="footer-last">
        <div class="footer-last-inner">
          <div class="footer-logo">
            <a href="https://www.ucuenca.edu.ec" target="_blank">
                <img src="https://nyc3.digitaloceanspaces.com/toronjafs/ucuencapress/ucuenca_logo.svg" alt="">
            </a>
          </div>
          <h5>
          © 2022 UCuencaPress
        </h5>
      </div>
      </div>
    </div>
  </div>


</div><!-- pkp_structure_content -->

<div class="pkp_structure_footer_wrapper" role="contentinfo">
	<a id="pkp_content_footer"></a>

	<div class="pkp_structure_footer">

		{if $pageFooter}
			<div class="pkp_footer_content">
				{$pageFooter}
			</div>
		{/if}

	</div>
</div><!-- pkp_structure_footer_wrapper -->

</div><!-- pkp_structure_page -->

{load_script context="frontend"}

{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>

