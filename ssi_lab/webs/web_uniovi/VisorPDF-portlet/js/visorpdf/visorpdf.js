	var DEFAULT_URL = '/VisorPDF-portlet/pordefectopdf/defecto.pdf';
	function cambiarpdf(url){
		if (Modernizr.canvas) {
			
			document.getElementById('mainContainer').removeAttribute('hidden');
						
			
			DEFAULT_URL = url;
			PDFView.open(DEFAULT_URL,0);
			

			document.getElementById('sidebarToggle').classList.toggle('toggled');
		    outerContainer.classList.add('sidebarMoving');
		    outerContainer.classList.toggle('sidebarOpen');
		    PDFView.sidebarOpen = true;
		    PDFView.renderHighestPriority();
		  
		    // Mantener title de la pagina.
		    //  document.title=TITLE_DOCUMENT +' - Visor de documentos';
		    
		  
		}else{
			document.getElementById('mostrar_html5_error').style.display = "block";
			document.getElementById('enlace_descarga').href=url;
		}
			
	}
			
	function comprobarkDefaultURL(){	
		if(DEFAULT_URL=='/VisorPDF-portlet/pordefectopdf/defecto.pdf'){
			document.getElementById('mainContainer').setAttribute('hidden', 'true');
		}
	}

			