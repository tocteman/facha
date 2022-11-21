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
          <a href="https://toronjafs.nyc3.cdn.digitaloceanspaces.com/ucuencapress/carta_servicios.pdf">
            <h5>
              Carta de Servicios
            </h5>
          </a>
        </div>
      </div>

      <div class="footer-info">
        <div class="footer-info-inner">
            <a href="https://www.instagram.com/ucuencapress/" class="footer-ig" style="line-height:0;">

  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-instagram"><rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect><path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z" style="margin-top:1rem"></path><line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line></svg>
            <div>
            instagram
            </div>
            </a>
          <h5 style="margin-top:1.2rem;">
            Honorato Loyola y Agustín Cueva
          </h5>
          <h5>
            (593-7) 405 1000 +1199
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
      <img src="https://toronjafs.nyc3.cdn.digitaloceanspaces.com/ucuencapress/ucuenca_logo.svg" alt="">
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

