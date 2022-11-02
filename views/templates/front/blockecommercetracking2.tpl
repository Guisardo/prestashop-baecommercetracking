{*
* 2007-2020 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@buy-addons.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
* @author    Buy-addons    <contact@buy-addons.com>
* @copyright 2007-2020 Buy-addons
* @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
<script>
	{literal}
   (
	function(i,s,o,g,r,a,m)
		{
				i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
						(i[r].q=i[r].q||[]).push(arguments)
					},
				i[r].l=1*new Date();a=s.createElement(o),
				m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		}
	)(window,document,'script','//www.google-analytics.com/analytics.js','ga');
	{/literal}
	window.dataLayer = window.dataLayer || [];
	ga('create', '{$baIdAnalytics|escape:'htmlall':'UTF-8'}', 
	{literal}
	{'clientId': (function () {
		let cookie_parts = ('; ' + document.cookie).split('; cid=');
		if (cookie_parts.length === 2) {
			cid = cookie_parts.pop().split(';').shift();
		} else {
			cid = parseInt(Math.random() * 2147483647);
			document.cookie = 'cid=' + cid + '; path=/; domain=.ropitas.com.ar; max-age=' + (86400 * 31 * 12);
		}
		return cid;
	})()});
	window.dataLayer.push({
		clientId: (function () {
			let cookie_parts = ('; ' + document.cookie).split('; cid=');
			if (cookie_parts.length === 2) {
				cid = cookie_parts.pop().split(';').shift();
			} else {
				cid = parseInt(Math.random() * 2147483647);
				document.cookie = 'cid=' + cid + '; path=/; domain=.ropitas.com.ar; max-age=' + (86400 * 31 * 12);
			}
			return cid;
		})(),
	});
	{/literal}
{if $id_customer}
ga('set', 'userId', '{$id_customer}');
window.dataLayer.push({
	userId: '{$id_customer}',
});
{/if}

	ga('send', 'pageview');
</script>

<!-- Facebook Pixel Code -->
<script>
  {literal}
  !function(f,b,e,v,n,t,s)
  {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
  n.callMethod.apply(n,arguments):n.queue.push(arguments)};
  if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
  n.queue=[];t=b.createElement(e);t.async=!0;
  t.src=v;s=b.getElementsByTagName(e)[0];
  s.parentNode.insertBefore(t,s)}(window, document,'script',
  'https://connect.facebook.net/en_US/fbevents.js');
  {/literal}
  fbq('init', '{$facebookId|escape:"htmlall":"UTF-8"}');
  fbq('track', 'PageView');
</script>
<noscript><img height="1" width="1" style="display:none"
  src="https://www.facebook.com/tr?id={$facebookId|escape:"htmlall":"UTF-8"}&ev=PageView&noscript=1"
/></noscript>
<!-- End Facebook Pixel Code -->

{if $page_type == 'cart'}
	<script>
	  fbq('track', 'InitiateCheckout');
	</script>
{/if}
{if $page_type == 'search'}
	<script>
	  fbq('track', 'Search');
	</script>
{/if}
{if $page_type == 'product'}
	<script>
	window.dataLayer = window.dataLayer || [];
	window.dataLayer.push({
		event: 'Product View',
	});

	setTimeout(() => {
		let getMeta = metaName => {
		  const metas = document.getElementsByTagName('meta')
		
		  for (let i = 0; i < metas.length; i++) {
		    if (metas[i].getAttribute('property') === metaName) {
		      return metas[i].getAttribute('content')
		    }
		  }
		
		  return ''
		}

	  fbq('track', 'ViewContent', {
		  content_ids: [getMeta('product:retailer_item_id')],
		  content_type: 'product'
	  })
	}, 500)
	</script>
{/if}
