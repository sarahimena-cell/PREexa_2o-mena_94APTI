<%@page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CiberLex | Auth Portal</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;800&family=JetBrains+Mono&display=swap" rel="stylesheet">
    <style>
        body {
            /* Usamos colores directos para evitar que NetBeans marque error en las variables */
            background-color: #0a0b10;
            background-image: radial-gradient(circle, #161b22 0%, #0a0b10 100%);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Plus Jakarta Sans', sans-serif;
            color: #ffffff;
            margin: 0;
            overflow: hidden;
        }

        .card-acceso {
            background-color: #161b22;
            border: 1px solid #00f2ff;
            box-shadow: 0 0 30px rgba(0, 242, 255, 0.2);
            border-radius: 20px;
            width: 100%;
            max-width: 400px;
        }

        .nav-tabs { border: none; }
        
        .nav-tabs .nav-link { 
            color: #ffffff !important; 
            opacity: 0.5;
            border: none; 
            font-family: 'JetBrains Mono', monospace;
            background: transparent;
        }

        .nav-tabs .nav-link.active { 
            color: #00f2ff !important; 
            opacity: 1;
            text-shadow: 0 0 10px #00f2ff;
            border-bottom: 2px solid #00f2ff;
            background: transparent;
        }

        .form-label { 
            color: #00f2ff !important; 
            font-weight: 600;
            font-size: 0.75rem;
            letter-spacing: 1px;
        }

        .form-control {
            background-color: #0d1117;
            border: 1px solid #30363d;
            color: #ffffff !important;
            border-radius: 12px;
            padding: 12px;
        }

        .form-control:focus {
            background-color: #0d1117;
            border-color: #ff007a;
            box-shadow: 0 0 10px rgba(255, 0, 122, 0.3);
            color: #ffffff;
        }

        .btn-auth {
            background: linear-gradient(45deg, #00f2ff, #7000ff);
            border: none;
            color: #ffffff;
            font-weight: 800;
            border-radius: 12px;
            padding: 12px;
            transition: 0.3s;
            margin-top: 10px;
        }

        .btn-auth:hover {
            transform: translateY(-2px);
            box-shadow: 0 0 20px rgba(0, 242, 255, 0.4);
            color: #ffffff;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-5 d-flex justify-content-center">
                <div class="card-acceso shadow-lg p-4">
                    <div class="text-center mb-4">
                        <h1 class="fw-800" style="color: #00f2ff; text-shadow: 0 0 15px rgba(0, 242, 255, 0.6); font-size: 2rem;">CiberLex</h1>
                        <p style="color: #ffffff; font-family: 'JetBrains Mono'; font-size: 0.7rem; opacity: 0.7;">TERMINAL_AUTH_v3.6.1</p>
                    </div>

                    <ul class="nav nav-tabs nav-justified mb-4" id="pestañasAcceso" role="tablist">
                        <li class="nav-item">
                            <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#login" type="button">ACCESS</button>
                        </li>
                        <li class="nav-item">
                            <button class="nav-link" data-bs-toggle="tab" data-bs-target="#registro" type="button">REGISTER</button>
                        </li>
                    </ul>

                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="login">
                            <form action="validar_login.jsp" method="POST">
                                <div class="mb-3">
                                    <label class="form-label">USER_ID</label>
                                    <input type="text" name="txtUser" class="form-control" placeholder="node_admin" required>
                                </div>
                                <div class="mb-4">
                                    <label class="form-label">PASSKEY</label>
                                    <input type="password" name="txtPass" class="form-control" placeholder="••••••••" required>
                                </div>
                                <button type="submit" class="btn btn-auth w-100">INITIALIZE_SESSION</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>