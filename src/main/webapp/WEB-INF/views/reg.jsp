<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration - Voting System</title>
    <link rel="stylesheet" href="css/regstyle.css">
</head>
<body>
    <div class="container">
        <div class="registration-wrapper">
            <div class="card registration-card">
                <div class="card__header">
                    <h1 class="registration-title">Create Your Account</h1>
                    <p class="registration-subtitle">Join our voting platform by filling out the form below</p>
                </div>
                
                <div class="card__body">
                    <form id="registrationForm" class="registration-form" action="register" method="post" novalidate>
                        <!-- Basic Information Section -->
                        <div class="form-section">
                            <h3 class="section-title">Basic Information</h3>
                            
                            <div class="form-group">
                                <label for="fullName" class="form-label">Full Name *</label>
                                <input 
                                    type="text" 
                                    id="fullName" 
                                    name="name" 
                                    class="form-control" 
                                    placeholder="Enter your full name"
                                    required
                                >
                            </div>

                            <div class="form-row">
                                <div class="form-group">
                                    <label for="email" class="form-label">Email Address *</label>
                                    <input 
                                        type="email" 
                                        id="email" 
                                        name="email" 
                                        class="form-control" 
                                        placeholder="Enter your email address"
                                        required
                                    >
                                </div>

                                <div class="form-group">
                                    <label for="dateOfBirth" class="form-label">Date of Birth *</label>
                                    <input 
                                        type="date" 
                                        id="dateOfBirth" 
                                        name="dob" 
                                        class="form-control" 
                                        required
                                    >
                                </div>
                            </div>

                            <!-- ✅ New Row: Address + Contact Number -->
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="address" class="form-label">Address *</label>
                                    <input 
                                        type="text" 
                                        id="address" 
                                        name="address" 
                                        class="form-control" 
                                        placeholder="Enter your full address"
                                        required
                                    >
                                </div>

                                <div class="form-group">
                                    <label for="phone" class="form-label">Contact Number *</label>
                                    <input 
                                        type="tel" 
                                        id="phone" 
                                        name="phone" 
                                        class="form-control" 
                                        placeholder="Enter your mobile number"
                                        required
                                        pattern="[0-9]{10}"
                                    >
                                    <small class="form-help">Enter 10 digit mobile number</small>
                                </div>
                            </div>
                            <!-- ✅ End of New Row -->

                            <div class="form-row">
                                <div class="form-group">
                                    <label for="password" class="form-label">Password *</label>
                                    <input 
                                        type="password" 
                                        id="password" 
                                        name="password" 
                                        class="form-control" 
                                        placeholder="Create a secure password"
                                        required
                                        minlength="8"
                                    >
                                </div>

                                <div class="form-group">
                                    <label for="role" class="form-label">Role *</label>
                                    <select 
                                        id="role" 
                                        name="role" 
                                        class="form-control" 
                                        required
                                    >
                                        <option value="">Select your role</option>
                                        <option value="VOTER">Voter</option>
                                        <option value="CANDIDATE">Candidate</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <!-- Candidate-specific Section -->
                        <div id="candidateSection" class="form-section candidate-section hidden">
                            <h3 class="section-title">Candidate Information</h3>
                            <p class="section-description">Additional information required for candidates</p>
                            
                            <div class="form-group">
                                <label for="partyName" class="form-label">Party Name *</label>
                                <input 
                                    type="text" 
                                    id="partyName" 
                                    name="party" 
                                    class="form-control" 
                                    placeholder="Enter your political party name"
                                >
                            </div>

                            <div class="form-group">
                                <label for="constituency" class="form-label">Constituency *</label>
                                <input 
                                    type="text" 
                                    id="constituency" 
                                    name="constituency" 
                                    class="form-control" 
                                    placeholder="Enter your constituency"
                                >
                            </div>

                            <div class="form-group">
                                <label for="bio" class="form-label">Biography *</label>
                                <textarea 
                                    id="bio" 
                                    name="bio" 
                                    class="form-control bio-textarea" 
                                    rows="4"
                                    placeholder="Tell voters about yourself..."
                                ></textarea>
                            </div>
                        </div>

                        <!-- Submit Button -->
                        <div class="form-actions">
                            <button type="submit" class="btn btn--primary btn--lg btn--full-width">
                                Create Account
                            </button>
                        </div>
                    </form>
                </div>

                <div class="card__footer">
                    <p class="footer-text">
                        Already have an account? 
                        <a href="login" class="footer-link">Sign in here</a>
                    </p>
                </div>
            </div>
        </div>
    </div>

    <script src="js/reg.js"></script>
</body>
</html>
