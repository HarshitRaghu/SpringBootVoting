<!DOCTYPE html> 
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Voting System Login</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/loginstyle.css">
</head>
<body>
    <div class="login-wrapper">
        <div class="container-fluid h-100">
            <div class="row h-100 justify-content-center align-items-center">
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="login-container">
                        <!-- Header -->
                        <div class="text-center mb-4">
                            <h1 class="login-title">
                                <i class="bi bi-shield-check me-2"></i>
                                Voting System Login
                            </h1>
                            <p class="login-subtitle">Secure access to the democratic process</p>
                        </div>

                        <!-- Login Form Card -->
                        <div class="card login-card">
                            <div class="card-body p-4">
                                <form id="loginForm" action = "checkUser" method ="post">
                                    <!-- Username Field -->
                                    <div class="form-group mb-3">
                                        <label for="username" class="form-label">
                                            <i class="bi bi-person me-1"></i>
                                            Username
                                        </label>
                                        <div class="input-group">
                                            <span class="input-group-text">
                                                <i class="bi bi-person-circle"></i>
                                            </span>
                                            <input 
                                                type="text" 
                                                class="form-control" 
                                                id="username" 
                                                placeholder="Enter your username"
                                                name = "email"
                                            >
                                        </div>
                                    </div>

                                    <!-- Password Field -->
                                    <div class="form-group mb-4">
                                        <label for="password" class="form-label">
                                            <i class="bi bi-lock me-1"></i>
                                            Password
                                        </label>
                                        <div class="input-group">
                                            <span class="input-group-text">
                                                <i class="bi bi-shield-lock"></i>
                                            </span>
                                            <input 
                                                type="password" 
                                                class="form-control" 
                                                id="password" 
                                                placeholder="Enter your password"
                                                name = "password"
                                            >
                                            <button 
                                                class="btn btn-outline-secondary" 
                                                type="button" 
                                                id="togglePassword"
                                                aria-label="Toggle password visibility"
                                            >
                                                <i class="bi bi-eye" id="toggleIcon"></i>
                                            </button>
                                        </div>
                                    </div>

                                    <!-- Login Buttons -->
                                    <div class="login-buttons mb-3">
                                        <button 
                                            type="submit" 
                                            class="btn btn-primary btn-login w-100 mb-2" 
                                            id="voterLogin"
                                            data-role="voter"
                                        >
                                            <i class="bi bi-person-check me-2"></i>
                                            <span class="btn-text">Login</span>
                                            <div class="spinner-border spinner-border-sm d-none" role="status" aria-hidden="true"></div>
                                        </button>
                                        
                                        

                                    <!-- Links -->
                                    <div class="login-links text-center">
                                        <div class="mb-2">
                                            <a href="reg" id="newVoterLink" class="link-secondary">
                                                <i class="bi bi-person-plus me-1"></i>
                                                New Voter Registration
                                            </a>
                                        </div>
											<div class="login-links text-center">
                                        <div class="mb-2">
                                            <a href="#" id="newCandidateLink" class="link-secondary">
                                                <i class="bi bi-person-plus me-1"></i>
                                                New Candidate Registration
                                            </a>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <!-- Footer -->
                        <div class="text-center mt-4">
                            <small class="text-muted">
                                © 2025 Voting System. All rights reserved.
                                <br>
                                Secure • Transparent • Democratic
                            </small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Success Modal -->
    <div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="loginModalLabel">Login Successful</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center">
                    <i class="bi bi-check-circle-fill text-success display-4 mb-3"></i>
                    <p id="loginMessage" class="mb-0"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Continue</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Custom JS -->
    <script src="js/loginapp.js"></script>
</body>
</html>