function getPortalPrivacyCookie(c_name) {
      var c_value = document.cookie;
      var c_start = c_value.indexOf(" " + c_name + "=");
      if (c_start == -1) {
            c_start = c_value.indexOf(c_name + "=");
      }
      if (c_start == -1) {
            c_value = false;
      } else {
            c_start = c_value.indexOf("=", c_start) + 1;
            var c_end = c_value.indexOf(";", c_start);
            if (c_end == -1) {
                  c_end = c_value.length;
            }
            c_value = unescape(c_value.substring(c_start, c_end));
      }
      return c_value;
}

function setPortalPrivacyCookie(domain, c_value) {
      var days = 365000;
      var date = new Date();
      date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
      var expires = "; expires=" + date.toGMTString();

      document.cookie = "webasturias_privacyPolicy = " + c_value + " " + expires
                  + "; path=/; domain=" + domain + ";";
      //
      var mesageLayer = document.getElementById('privacyPolicyLayer')
      if (mesageLayer) {
            mesageLayer.parentNode.removeChild(mesageLayer);
      }
}

function parseUri(str) {
      var o = parseUri.options, m = o.parser[o.strictMode ? "strict" : "loose"]
                  .exec(str), uri = {}, i = 14;

      while (i--)
            uri[o.key[i]] = m[i] || "";

      uri[o.q.name] = {};
      uri[o.key[12]].replace(o.q.parser, function($0, $1, $2) {
            if ($1)
                  uri[o.q.name][$1] = $2;
      });

      return uri;
};

parseUri.options = {
      strictMode : false,
      key : [ "source", "protocol", "authority", "userInfo", "user", "password",
                  "host", "port", "relative", "path", "directory", "file", "query",
                  "anchor" ],
      q : {
            name : "queryKey",
            parser : /(?:^|&)([^&=]*)=?([^&]*)/g
      },
      parser : {
            strict : /^(?:([^:\/?#]+):)?(?:\/\/((?:(([^:@]*)(?::([^:@]*))?)?@)?([^:\/?#]*)(?::(\d*))?))?((((?:[^?#\/]*\/)*)([^?#]*))(?:\?([^#]*))?(?:#(.*))?)/,
            loose : /^(?:(?![^:@]+:[^:@\/]*@)([^:\/?#.]+):)?(?:\/\/)?((?:(([^:@]*)(?::([^:@]*))?)?@)?([^:\/?#]*)(?::(\d*))?)(((\/(?:[^?#](?![^?#\/]*\.[^?#\/.]+(?:[?#]|$)))*\/?)?([^?#\/]*))(?:\?([^#]*))?(?:#(.*))?)/
      }
};

function createHtml(htmlStr) {
      var frag = document.createDocumentFragment(), temp = document
                  .createElement('div');
      temp.innerHTML = htmlStr;
      while (temp.firstChild) {
            frag.appendChild(temp.firstChild);
      }
      return frag;
}

function checkPrivacyPolicy() {

      if (window.opener)
            return;
      if (window.location === window.parent.location) {
            // Get the location url
            var uri = parseUri(document.location);
            
                  var rootDomain = uri.host;
      
            // GET COOKIE INFO
            var privacyCookie = getPortalPrivacyCookie('webasturias_privacyPolicy');
      
            if (!privacyCookie) {
                // Fix cookie and show msg
                setPortalPrivacyCookie(rootDomain, 0);
                showPrivacyCookieLayer(rootDomain);
            } else if (privacyCookie != 1) {
                showPrivacyCookieLayer(rootDomain);
            }
                  
            if (document.getElementById('portalPrivacyPolicyCloseButton') != null) {
                  jQuery('#portalPrivacyPolicyCloseButton').click(function() {
                        setPortalPrivacyCookie(rootDomain, 1);
                        jQuery('#portalPrivacyPolicyLayer').hide();
                  });
            }
      }
}