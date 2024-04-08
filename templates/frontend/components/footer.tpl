</div><!-- pkp_structure_main -->
<div class="footer-area">
   <div class="footer-container">
      <div class="footer-logo">
         <a href="https://www.ucuenca.edu.ec" target="_blank">
         <img src="https://toronjafs.nyc3.cdn.digitaloceanspaces.com/ucuencapress/ucuenca_logo.svg" alt="">
         </a>
      </div>
      <div class="footer-cols">
         <div class="footer-info">
            <h5 style="margin-top:1.2rem;">
               Honorato Loyola y Agustín Cueva
            </h5>
            <h5>
               (593-7) 405 1000 +1199
            </h5>
            <h5>
               Cuenca - Ecuador
            </h5>
            <h5>
            </h5>
         </div>
         <div class="footer-resources">
            <div class="footer-resources-inner">
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
               <a href="https://toronjafs.nyc3.cdn.digitaloceanspaces.com/ucuencapress/carta_servicios.pdf">
                  <h5>
                     Carta de Servicios
                  </h5>
               </a>
            </div>
         </div>

        <div class="footer-last">
          <h5>
               <a href="{url router=$smarty.const.ROUTE_PAGE page="about" op="contact"}">
               <h5>
                  Contacto
               </h5>
               </a>
               <h5>
              <a href="https://www.instagram.com/ucuencapress/" style="line-height:0;">
                  Instagram
              </a>
            </h5>
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
</div>
<!-- pkp_structure_footer_wrapper -->
</div><!-- pkp_structure_page -->
{load_script context="frontend"}
{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>

