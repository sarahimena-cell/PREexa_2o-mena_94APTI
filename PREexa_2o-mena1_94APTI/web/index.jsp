<%-- 1. INTEGRACIÓN DEL WAF Y PROTECCIÓN DE SESIÓN --%>
<%@ include file="filtro_waf.jsp" %>
<%
    if (session.getAttribute("session_usuario") == null) {
        response.sendRedirect("acceso.jsp");
        return;
    }
%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="conexion.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CiberLex | Neural Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;800&family=JetBrains+Mono&display=swap" rel="stylesheet">

    <style>
        body { 
            background-color: #0a0b10; 
            font-family: 'Plus Jakarta Sans', sans-serif; 
            color: #ffffff; 
            overflow-x: hidden; 
        }
        
        .header-cyber {
            background-color: #161b22;
            border-bottom: 1px solid #00f2ff;
            box-shadow: 0 0 20px rgba(0, 242, 255, 0.15);
        }

        .card-custom { 
            background-color: #161b22 !important; 
            border: 1px solid rgba(255,255,255,0.1) !important; 
            border-radius: 20px; 
            transition: 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }
        
        .card-custom:hover { 
            border-color: #00f2ff !important; 
            box-shadow: 0 0 20px rgba(0, 242, 255, 0.2);
            transform: translateY(-5px);
        }

        .search-box { 
            background-color: #0d1117 !important; 
            border: 1px solid #30363d !important; 
            color: #ffffff !important; 
            border-radius: 14px; 
            padding-left: 45px;
        }

        .filter-btn { 
            background-color: #21262d; 
            border: 1px solid #30363d; 
            color: #ffffff; 
            border-radius: 12px; 
            font-weight: 600; 
            margin-right: 5px;
            transition: 0.3s;
        }
        
        .filter-btn.active { 
            background-color: #00f2ff; 
            color: #000000; 
            border-color: #00f2ff; 
            box-shadow: 0 0 10px rgba(0, 242, 255, 0.4);
        }

        .news-feed { 
            background-color: #161b22; 
            border: 1px solid #7000ff; 
            border-radius: 20px; 
            padding: 24px; 
            position: sticky; 
            top: 20px;
        }
        
        .news-item a { 
            text-decoration: none; 
            color: #ffffff; 
            font-size: 0.85rem; 
            font-family: 'JetBrains Mono', monospace; 
        }
        
        .news-item a:hover { color: #00f2ff; text-shadow: 0 0 5px #00f2ff; }
        .news-date { color: #00f2ff; font-size: 0.7rem; margin-bottom: 4px; }
        
        .recurso-contenido {
            color: #cbd5e1 !important; 
            line-height: 1.6;
            font-size: 0.9rem;
        }
    </style>
</head>
<body class="container py-4">

    <header class="header-cyber p-4 rounded-4 mb-5 d-flex justify-content-between align-items-center">
        <div>
            <h1 class="h2 mb-0 fw-800" style="color: #00f2ff; text-shadow: 0 0 10px rgba(0,242,255,0.4);">CiberLex <span style="color: #ff007a;">2026</span></h1>
            <p class="small mb-0" style="font-family: 'JetBrains Mono'; color: #ffffff;">NODE_STATUS: <span class="text-success">ENCRYPTED_AND_SECURE</span></p>
        </div>
        <div class="d-flex align-items-center gap-3">
            <div class="text-end">
                <p class="mb-0 fw-bold small" style="color: #ffffff;"><%= session.getAttribute("session_usuario")%></p>
                <span class="badge border border-info text-info" style="font-size: 0.6rem;">ADMIN_VERIFIED</span>
            </div>
            <a href="logout.jsp" class="btn btn-outline-danger rounded-circle p-2"><i class="bi bi-power"></i></a>
        </div>
    </header>

    <div class="row g-4">
        <div class="col-lg-9">
            <%-- BUSCADOR --%>
            <div class="row g-3 mb-4 align-items-center">
                <div class="col-md-8 position-relative">
                    <i class="bi bi-search position-absolute" style="left: 25px; top: 12px; color: #00f2ff;"></i>
                    <input type="text" id="busqueda" class="form-control search-box" placeholder="Escanear base de datos..." onkeyup="buscarRecurso()">
                </div>
                <div class="col-md-4 text-end">
                    <% if ("admin".equals(session.getAttribute("session_rol"))) { %>
                        <a href="nuevo_tip.jsp" class="btn btn-info fw-bold w-100" style="background-color: #00f2ff; border:none; color:#000; border-radius:12px;">+ NUEVO REGISTRO</a>
                    <% } %>
                </div>
            </div>

            <%-- FILTROS --%>
            <div class="d-flex gap-2 mb-5 overflow-x-auto pb-2">
                <button class="btn filter-btn active" onclick="filtrar('todos', this)">TODOS</button>
                <button class="btn filter-btn" onclick="filtrar('legislacion', this)">LEGAL</button>
                <button class="btn filter-btn" onclick="filtrar('tip_tecnico', this)">TECH_TIPS</button>
                <button class="btn filter-btn" onclick="filtrar('consejo', this)">CONSEJOS</button>
            </div>

            <div class="row g-4" id="contenedor-recursos">
                <%
                    try {
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("SELECT * FROM recursos_seguridad ORDER BY id_recurso DESC");
                        while (rs.next()) {
                            String id = rs.getString("id_recurso");
                            String cont = rs.getString("contenido");
                            String cat = rs.getString("categoria").toLowerCase();
                            
                            String nColor = "#00f2ff"; 
                            if (cat.contains("legis")) { nColor = "#ff007a"; } 
                            else if (cat.contains("cons")) { nColor = "#7000ff"; } 
                %>
                <div class="col-md-6 recurso-card" data-categoria="<%= cat.trim() %>">
                    <div class="card h-100 card-custom border-top border-4" style="border-top-color: <%= nColor %> !important;">
                        <div class="card-body d-flex flex-column p-4">
                            <div class="d-flex justify-content-between mb-3 align-items-center">
                                <span class="badge" style="background-color: <%= nColor %>; color: #000; font-size: 0.65rem;"><%= cat.toUpperCase() %></span>
                                
                                <% if ("admin".equals(session.getAttribute("session_rol"))) { %>
                                <div class="dropdown">
                                    <button class="btn btn-link text-white p-0" type="button" data-bs-toggle="dropdown">
                                        <i class="bi bi-three-dots-vertical"></i>
                                    </button>
                                    <ul class="dropdown-menu dropdown-menu-dark shadow border-secondary">
                                        <li><a class="dropdown-item" href="editar.jsp?id=<%= id %>"><i class="bi bi-pencil-square me-2"></i>Editar</a></li>
                                        <li><hr class="dropdown-divider border-secondary"></li>
                                        <li><a class="dropdown-item text-danger" href="eliminar.jsp?id=<%= id %>" onclick="return confirm('¿Eliminar recurso?')"><i class="bi bi-trash me-2"></i>Eliminar</a></li>
                                    </ul>
                                </div>
                                <% } %>
                            </div>

                            <h5 class="fw-bold mb-3 titulo-recurso" style="color: <%= nColor %>; text-shadow: 0 0 5px rgba(0,0,0,0.5);"><%= rs.getString("titulo")%></h5>
                            <div class="recurso-contenido flex-grow-1"><%= cont %></div>
                            
                            <div class="mt-4">
                                <% 
                                    int startIdx = cont.indexOf("https://");
                                    if (startIdx == -1) startIdx = cont.indexOf("http://");
                                    if (startIdx != -1) {
                                        String url = cont.substring(startIdx).trim();
                                %>
                                    <a href="<%= url %>" target="_blank" class="btn btn-sm w-100 fw-bold" 
                                       style="color: <%= nColor %>; border: 1px solid <%= nColor %>; background: transparent; border-radius: 10px;">
                                       <%= url.contains("youtube") ? "REPRODUCIR MEDIA" : "ABRIR FUENTE" %>
                                    </a>
                                <% } %>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                        }
                    } catch (Exception e) { out.print("Error: " + e.getMessage()); }
                %>
            </div>
        </div>

        <%-- FEED LATERAL --%>
        <div class="col-lg-3">
            <div class="news-feed shadow-sm">
                <h6 class="fw-bold mb-4 text-center" style="color: #7000ff; text-shadow: 0 0 8px rgba(112, 0, 255, 0.4);">
                    <i class="bi bi-lightning-charge-fill me-2"></i>LIVE_INTELLIGENCE
                </h6>
                <div id="rss-feed-container">
                    <div class="text-center py-4">
                        <div class="spinner-border text-info spinner-border-sm" role="status"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function filtrar(cat, btn) {
            document.querySelectorAll('.filter-btn').forEach(b => b.classList.remove('active'));
            btn.classList.add('active');
            document.querySelectorAll('.recurso-card').forEach(c => {
                const cardCat = c.getAttribute('data-categoria');
                c.classList.toggle('d-none', cat !== 'todos' && cardCat !== cat);
            });
        }

        function buscarRecurso() {
            let input = document.getElementById('busqueda').value.toLowerCase();
            let cards = document.querySelectorAll('.recurso-card');
            cards.forEach(card => {
                let titulo = card.querySelector('.titulo-recurso').innerText.toLowerCase();
                card.classList.toggle('d-none', !titulo.includes(input));
            });
        }

        async function cargarRSS() {
            var RSS_URL = 'https://thehackernews.com/feeds/posts/default?alt=rss';
            var container = document.getElementById('rss-feed-container');
            try {
                var response = await fetch('https://api.rss2json.com/v1/api.json?rss_url=' + encodeURIComponent(RSS_URL));
                var data = await response.json();
                if (data.status === 'ok') {
                    container.innerHTML = '';
                    data.items.slice(0, 6).forEach(function(item) {
                        var div = document.createElement('div');
                        div.className = 'news-item mb-3 border-bottom border-secondary pb-2';
                        var fecha = new Date(item.pubDate).toLocaleDateString('es-MX', {day:'numeric', month:'short'});
                        div.innerHTML = '<div class="news-date">' + fecha + '</div>' +
                                        '<a href="' + item.link + '" target="_blank">' + item.title + '</a>';
                        container.appendChild(div);
                    });
                }
            } catch (e) { container.innerHTML = '<small class="text-muted">Offline Mode</small>'; }
        }
        window.onload = cargarRSS;
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>