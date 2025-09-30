<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration - Election Management System</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/regStyle.css">
</head>
<body>
    <div class="container-fluid min-vh-100">
        <!-- Header -->
        <header class="py-3 mb-4" style="background: var(--color-primary);">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col">
                        <h1 class="h3 mb-0" style="color: var(--color-btn-primary-text);">
                            <i class="bi bi-person-plus me-2"></i>
                            User Registration
                        </h1>
                        <p class="mb-0" style="color: rgba(255, 255, 255, 0.8);">
                            Create your account to participate in elections
                        </p>
                    </div>
                </div>
            </div>
        </header>

        <!-- Main Content -->
        <main class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-md-8 col-lg-6">
                    <div class="card">
                        <div class="card__header">
                            <h2 class="h5 mb-0" style="color: var(--color-primary);">
                                <i class="bi bi-clipboard-data me-2"></i>
                                Registration Information
                            </h2>
                        </div>
                        
                        <div class="card__body">
                            <form id="registrationForm" enctype="multipart/form-data" action="register" method="post" novalidate>
                                <!-- Full Name -->
                                <div class="form-group">
                                    <label for="name" class="form-label">
                                        Full Name
                                        <span class="required">*</span>
                                    </label>
                                    <div class="input-group">
                                        <span class="input-group-text">
                                            <i class="bi bi-person" style="color: var(--color-primary);"></i>
                                        </span>
                                        <input 
                                            type="text" 
                                            class="form-control" 
                                            id="name" 
                                            name="name" 
                                            placeholder="Enter your full name"
                                            required
                                        >
                                    </div>
                                </div>

                                <!-- Email Address -->
                                <div class="form-group">
                                    <label for="email" class="form-label">
                                        Email Address
                                        <span class="required">*</span>
                                    </label>
                                    <div class="input-group">
                                        <span class="input-group-text">
                                            <i class="bi bi-envelope" style="color: var(--color-primary);"></i>
                                        </span>
                                        <input 
                                            type="email" 
                                            class="form-control" 
                                            id="email" 
                                            name="email" 
                                            placeholder="example@domain.com"
                                            required
                                        >
                                    </div>
                                </div>

                                <!-- Password -->
                                <div class="form-group">
                                    <label for="password" class="form-label">
                                        Password
                                        <span class="required">*</span>
                                    </label>
                                    <div class="input-group">
                                        <span class="input-group-text">
                                            <i class="bi bi-lock" style="color: var(--color-primary);"></i>
                                        </span>
                                        <input 
                                            type="password" 
                                            class="form-control" 
                                            id="password" 
                                            name="password" 
                                            placeholder="Enter a strong password"
                                            required
                                        >
                                    </div>
                                </div>

                                <!-- Date of Birth -->
                                <div class="form-group">
                                    <label for="dob" class="form-label">
                                        Date of Birth
                                        <span class="required">*</span>
                                    </label>
                                    <div class="input-group">
                                        <span class="input-group-text">
                                            <i class="bi bi-calendar-event" style="color: var(--color-primary);"></i>
                                        </span>
                                        <input 
                                            type="date" 
                                            class="form-control" 
                                            id="dob" 
                                            name="dob"
                                            required
                                        >
                                    </div>
                                </div>

                                <!-- Phone Number -->
                                <div class="form-group">
                                    <label for="phone" class="form-label">
                                        Phone Number
                                        <span class="required">*</span>
                                    </label>
                                    <div class="input-group">
                                        <span class="input-group-text">
                                            <i class="bi bi-telephone" style="color: var(--color-primary);"></i>
                                        </span>
                                        <input 
                                            type="tel" 
                                            class="form-control" 
                                            id="phone" 
                                            name="phone" 
                                            pattern="[0-9]{10}" 
                                            placeholder="Enter 10-digit phone number"
                                            required
                                        >
                                    </div>
                                    <small class="form-text" style="color: var(--color-text-secondary);">
                                        <i class="bi bi-info-circle me-1"></i>
                                        Enter 10-digit phone number without spaces or dashes
                                    </small>
                                </div>

                                <!-- Address -->
                                <div class="form-group">
                                    <label for="address" class="form-label">
                                        Address
                                        <span class="required">*</span>
                                    </label>
                                    <div class="input-group">
                                        <span class="input-group-text" style="align-items: flex-start; padding-top: var(--space-8);">
                                            <i class="bi bi-geo-alt" style="color: var(--color-primary);"></i>
                                        </span>
                                        <textarea 
                                            class="form-control" 
                                            id="address" 
                                            name="address" 
                                            rows="4" 
                                            placeholder="Enter your complete address"
                                            required
                                        ></textarea>
                                    </div>
                                </div>

                                <!-- Role Selection -->
                                <div class="form-group">
                                    <label for="role" class="form-label">
                                        Role
                                        <span class="required">*</span>
                                    </label>
                                    <div class="input-group">
                                        <span class="input-group-text">
                                            <i class="bi bi-person-badge" style="color: var(--color-primary);"></i>
                                        </span>
                                        <select class="form-control" id="role" name="role" required>
                                            <option value="VOTER" selected>Voter</option>
                                            <option value="CANDIDATE">Candidate</option>
                                        </select>
                                    </div>
                                    <small class="form-text" style="color: var(--color-text-secondary);">
                                        <i class="bi bi-info-circle me-1"></i>
                                        Select your role in the election system
                                    </small>
                                </div>

                                <!-- Candidate Fields -->
                                <div id="candidateFields" class="candidate-fields" style="display: none;">
                                    <div class="candidate-section-header">
                                        <h4 style="color: var(--color-primary); margin-bottom: var(--space-16);">
                                            <i class="bi bi-person-check me-2"></i>
                                            Candidate Information
                                        </h4>
                                    </div>

                                    <!-- Party Name -->
                                    <div class="form-group">
                                        <label for="party" class="form-label">Party Name</label>
                                        <div class="input-group">
                                            <span class="input-group-text">
                                                <i class="bi bi-flag" style="color: var(--color-primary);"></i>
                                            </span>
                                            <input 
                                                type="text" 
                                                class="form-control" 
                                                id="party" 
                                                name="party" 
                                                placeholder="Enter your party name"
                                            >
                                        </div>
                                    </div>

                                    <!-- Constituency -->
                                    <div class="form-group">
                                        <label for="constituency" class="form-label">Constituency</label>
                                        <div class="input-group">
                                            <span class="input-group-text">
                                                <i class="bi bi-map" style="color: var(--color-primary);"></i>
                                            </span>
                                            <input 
                                                type="text" 
                                                class="form-control" 
                                                id="constituency" 
                                                name="constituency" 
                                                placeholder="Enter your constituency"
                                            >
                                        </div>
                                    </div>

                                    <!-- Biography -->
                                    <div class="form-group">
                                        <label for="bio" class="form-label">Biography</label>
                                        <div class="input-group">
                                            <span class="input-group-text" style="align-items: flex-start; padding-top: var(--space-8);">
                                                <i class="bi bi-card-text" style="color: var(--color-primary);"></i>
                                            </span>
                                            <textarea 
                                                class="form-control" 
                                                id="bio" 
                                                name="bio" 
                                                rows="4" 
                                                placeholder="Write a brief biography"
                                            ></textarea>
                                        </div>
                                    </div>

                                    <!-- Party Logo -->
                                    <div class="form-group">
                                        <label for="partyLogo" class="form-label">Party Logo</label>
                                        <div class="input-group">
                                            <span class="input-group-text">
                                                <i class="bi bi-image" style="color: var(--color-primary);"></i>
                                            </span>
                                            <input 
                                                type="file" 
                                                class="form-control" 
                                                id="partyLogo" 
                                                name="party_logo" 
                                                accept="image/*"
                                            >
                                        </div>
                                        <small class="form-text" style="color: var(--color-text-secondary);">
                                            <i class="bi bi-info-circle me-1"></i>
                                            Upload your party's logo (JPG, PNG, or GIF)
                                        </small>
                                    </div>

                                    <!-- Profile Picture -->
                                    <div class="form-group">
                                        <label for="profilePicture" class="form-label">Profile Picture</label>
                                        <div class="input-group">
                                            <span class="input-group-text">
                                                <i class="bi bi-person-circle" style="color: var(--color-primary);"></i>
                                            </span>
                                            <input 
                                                type="file" 
                                                class="form-control" 
                                                id="profilePicture" 
                                                name="profile_photo" 
                                                accept="image/*"
                                            >
                                        </div>
                                        <small class="form-text" style="color: var(--color-text-secondary);">
                                            <i class="bi bi-info-circle me-1"></i>
                                            Upload your profile picture (JPG, PNG, or GIF)
                                        </small>
                                    </div>
                                </div>

                                <!-- Submit Button -->
                                <div class="d-grid gap-2 mt-4">
                                    <button type="submit" class="btn btn--primary btn--lg">
                                        <i class="bi bi-check-circle me-2"></i>
                                        Submit Registration
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!-- Footer -->
        <footer class="mt-5 py-3 text-center" style="color: var(--color-text-secondary);">
            <small>&copy; 2025 Election Management System. All rights reserved.</small>
        </footer>
    </div>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Custom JS -->
    <script src="js/regApp.js"></script>
</body>
</html>