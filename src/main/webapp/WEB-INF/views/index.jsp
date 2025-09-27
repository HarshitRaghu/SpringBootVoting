<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VoteSecure - Secure Online Voting Portal</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
</head>
<body class="overflow-x-hidden">
    <!-- Animated Background -->
    <div class="fixed inset-0 z-0 background-animation">
        <div class="floating-shapes">
            <div class="shape shape-1"></div>
            <div class="shape shape-2"></div>
            <div class="shape shape-3"></div>
            <div class="shape shape-4"></div>
            <div class="shape shape-5"></div>
        </div>
        <div class="gradient-overlay"></div>
    </div>

    <!-- Header -->
    <header class="relative z-10 bg-white/90 backdrop-blur-md border-b border-gray-200/50 sticky top-0">
        <div class="container mx-auto px-6">
            <div class="flex items-center justify-between h-16">
                <div class="flex items-center space-x-2">
                    <div class="w-8 h-8 bg-gradient-to-r from-blue-600 to-blue-700 rounded-lg flex items-center justify-center">
                        <svg class="w-5 h-5 text-white" fill="currentColor" viewBox="0 0 24 24">
                            <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-1 17.93c-3.94-.49-7-3.85-7-7.93 0-.62.08-1.21.21-1.79L9 15v1c0 1.1.9 2 2 2v1.93zm6.9-2.54c-.26-.81-1-1.39-1.9-1.39h-1v-3c0-.55-.45-1-1-1H8v-2h2c.55 0 1-.45 1-1V7h2c1.1 0 2-.9 2-2v-.41c2.93 1.19 5 4.06 5 7.41 0 2.08-.8 3.97-2.1 5.39z"/>
                        </svg>
                    </div>
                    <span class="text-xl font-bold text-gray-800">VoteSecure</span>
                </div>
                
                <nav class="hidden md:flex items-center space-x-8">
                    <a href="#features" class="nav-link">Features</a>
                    <a href="#how-it-works" class="nav-link">How It Works</a>
                    <a href="#security" class="nav-link">Security</a>
                </nav>
            </div>
        </div>
    </header>

    <!-- Hero Section -->
    <section class="relative z-10 min-h-screen flex items-center justify-center pt-16">
        <div class="container mx-auto px-6 text-center">
            <div data-aos="fade-up" data-aos-duration="800">
                <h1 class="text-5xl md:text-7xl font-bold mb-6 leading-tight">
                    <span class="secure-digital-text">Secure Digital</span>
                    <span class="text-gradient">Democracy</span>
                </h1>
                <p class="hero-subtitle text-xl md:text-2xl mb-8 max-w-3xl mx-auto leading-relaxed">
                    Experience the future of voting with our cutting-edge secure online platform. 
                    Your voice matters, and your vote is protected with bank-level security.
                </p>
                <div class="flex flex-col sm:flex-row items-center justify-center space-y-4 sm:space-y-0 sm:space-x-6">
                  <a href="login" ><button id="enterPortalBtn" class="btn btn--primary btn--lg pulse-animation" >
                        Enter Voting Portal
                        <svg class="w-5 h-5 ml-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7l5 5m0 0l-5 5m5-5H6"/>
                        </svg>
                    </button>
                    </a>  
                    <button class="btn btn--outline btn--lg">
                        Learn More
                    </button>
                </div>
            </div>
            
            <div data-aos="fade-up" data-aos-delay="400" class="mt-16">
                <div class="grid grid-cols-2 md:grid-cols-4 gap-8 max-w-4xl mx-auto">
                    <div class="text-center">
                        <div class="text-3xl font-bold text-blue-600">2M+</div>
                        <div class="stats-label">Secure Votes</div>
                    </div>
                    <div class="text-center">
                        <div class="text-3xl font-bold text-blue-600">99.9%</div>
                        <div class="stats-label">Uptime</div>
                    </div>
                    <div class="text-center">
                        <div class="text-3xl font-bold text-blue-600">256-bit</div>
                        <div class="stats-label">Encryption</div>
                    </div>
                    <div class="text-center">
                        <div class="text-3xl font-bold text-blue-600">24/7</div>
                        <div class="stats-label">Support</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section id="features" class="relative z-10 py-20 bg-white/80 backdrop-blur-md">
        <div class="container mx-auto px-6">
            <div class="text-center mb-16" data-aos="fade-up">
                <h2 class="section-heading text-4xl font-bold mb-4">Why Choose VoteSecure?</h2>
                <p class="section-subtitle text-xl max-w-2xl mx-auto">
                    Built with cutting-edge technology and designed for democracy
                </p>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
                <div class="card feature-card" data-aos="fade-up" data-aos-delay="100">
                    <div class="card__body text-center">
                        <div class="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center mx-auto mb-4">
                            <svg class="w-8 h-8 text-blue-600" fill="currentColor" viewBox="0 0 24 24">
                                <path d="M12,1L3,5V11C3,16.55 6.84,21.74 12,23C17.16,21.74 21,16.55 21,11V5L12,1M12,7C13.4,7 14.8,8.6 14.8,10V11.5C15.4,11.5 16,12.1 16,12.7V16.7C16,17.4 15.4,18 14.8,18H9.2C8.6,18 8,17.4 8,16.8V12.8C8,12.1 8.6,11.5 9.2,11.5V10C9.2,8.6 10.6,7 12,7M12,8.2C11.2,8.2 10.5,8.7 10.5,10V11.5H13.5V10C13.5,8.7 12.8,8.2 12,8.2Z"/>
                            </svg>
                        </div>
                        <h3 class="feature-title text-xl font-semibold mb-3">Bank-Level Security</h3>
                        <p class="feature-description">End-to-end encryption and multi-factor authentication protect your vote</p>
                    </div>
                </div>

                <div class="card feature-card" data-aos="fade-up" data-aos-delay="200">
                    <div class="card__body text-center">
                        <div class="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-4">
                            <svg class="w-8 h-8 text-green-600" fill="currentColor" viewBox="0 0 24 24">
                                <path d="M12,9A3,3 0 0,0 9,12A3,3 0 0,0 12,15A3,3 0 0,0 15,12A3,3 0 0,0 12,9M12,17A5,5 0 0,1 7,12A5,5 0 0,1 12,7A5,5 0 0,1 17,12A5,5 0 0,1 12,17M12,4.5C7,4.5 2.73,7.61 1,12C2.73,16.39 7,19.5 12,19.5C17,19.5 21.27,16.39 23,12C21.27,7.61 17,4.5 12,4.5Z"/>
                            </svg>
                        </div>
                        <h3 class="feature-title text-xl font-semibold mb-3">Complete Transparency</h3>
                        <p class="feature-description">Real-time results and audit trails ensure election integrity</p>
                    </div>
                </div>

                <div class="card feature-card" data-aos="fade-up" data-aos-delay="300">
                    <div class="card__body text-center">
                        <div class="w-16 h-16 bg-purple-100 rounded-full flex items-center justify-center mx-auto mb-4">
                            <svg class="w-8 h-8 text-purple-600" fill="currentColor" viewBox="0 0 24 24">
                                <path d="M12,20A8,8 0 0,0 20,12A8,8 0 0,0 12,4A8,8 0 0,0 4,12A8,8 0 0,0 12,20M12,2A10,10 0 0,1 22,12A10,10 0 0,1 12,22C6.47,22 2,17.5 2,12A10,10 0 0,1 12,2M12.5,7V12.25L17,14.92L16.25,16.15L11,13V7H12.5Z"/>
                            </svg>
                        </div>
                        <h3 class="feature-title text-xl font-semibold mb-3">24/7 Accessibility</h3>
                        <p class="feature-description">Vote anytime, anywhere with our mobile-friendly platform</p>
                    </div>
                </div>

                <div class="card feature-card" data-aos="fade-up" data-aos-delay="400">
                    <div class="card__body text-center">
                        <div class="w-16 h-16 bg-teal-100 rounded-full flex items-center justify-center mx-auto mb-4">
                            <svg class="w-8 h-8 text-teal-600" fill="currentColor" viewBox="0 0 24 24">
                                <path d="M21,7L9,19L3.5,13.5L4.91,12.09L9,16.17L19.59,5.59L21,7Z"/>
                            </svg>
                        </div>
                        <h3 class="feature-title text-xl font-semibold mb-3">Verified Identity</h3>
                        <p class="feature-description">Advanced biometric and document verification prevents fraud</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- How It Works Section -->
    <section id="how-it-works" class="relative z-10 py-20">
        <div class="container mx-auto px-6">
            <div class="text-center mb-16" data-aos="fade-up">
                <h2 class="how-it-works-heading text-4xl font-bold mb-4">How It Works</h2>
                <p class="section-subtitle text-xl max-w-2xl mx-auto">
                    Three simple steps to cast your secure vote
                </p>
            </div>

            <div class="max-w-4xl mx-auto">
                <div class="space-y-12">
                    <div class="flex flex-col md:flex-row items-center" data-aos="fade-right" data-aos-delay="100">
                        <div class="flex-shrink-0 w-24 h-24 bg-blue-600 rounded-full flex items-center justify-center mb-6 md:mb-0 md:mr-8">
                            <span class="text-2xl font-bold text-white">01</span>
                        </div>
                        <div class="text-center md:text-left">
                            <h3 class="step-title text-2xl font-semibold mb-3">Register & Verify</h3>
                            <p class="step-description text-lg">Create your secure account and verify your identity with government documents</p>
                        </div>
                    </div>

                    <div class="flex flex-col md:flex-row-reverse items-center" data-aos="fade-left" data-aos-delay="200">
                        <div class="flex-shrink-0 w-24 h-24 bg-green-600 rounded-full flex items-center justify-center mb-6 md:mb-0 md:ml-8">
                            <span class="text-2xl font-bold text-white">02</span>
                        </div>
                        <div class="text-center md:text-right">
                            <h3 class="step-title text-2xl font-semibold mb-3">Access Ballot</h3>
                            <p class="step-description text-lg">Login securely and access your personalized ballot with local and national candidates</p>
                        </div>
                    </div>

                    <div class="flex flex-col md:flex-row items-center" data-aos="fade-right" data-aos-delay="300">
                        <div class="flex-shrink-0 w-24 h-24 bg-purple-600 rounded-full flex items-center justify-center mb-6 md:mb-0 md:mr-8">
                            <span class="text-2xl font-bold text-white">03</span>
                        </div>
                        <div class="text-center md:text-left">
                            <h3 class="step-title text-2xl font-semibold mb-3">Cast Your Vote</h3>
                            <p class="step-description text-lg">Make your selections and submit your encrypted ballot with full audit trail</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Security Section -->
    <section id="security" class="relative z-10 py-20 bg-white/80 backdrop-blur-md">
        <div class="container mx-auto px-6">
            <div class="text-center mb-16" data-aos="fade-up">
                <h2 class="section-heading text-4xl font-bold mb-4">Trust & Security</h2>
                <p class="section-subtitle text-xl max-w-2xl mx-auto">
                    Built with the highest security standards for democratic processes
                </p>
            </div>

            <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
                <div data-aos="fade-right">
                    <div class="space-y-6">
                        <div class="flex items-start space-x-4">
                            <div class="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center flex-shrink-0">
                                <svg class="w-6 h-6 text-blue-600" fill="currentColor" viewBox="0 0 24 24">
                                    <path d="M12,1L3,5V11C3,16.55 6.84,21.74 12,23C17.16,21.74 21,16.55 21,11V5L12,1Z"/>
                                </svg>
                            </div>
                            <div>
                                <h4 class="security-feature-title text-xl font-semibold mb-2">End-to-End Encryption</h4>
                                <p class="security-feature-description">Every vote is encrypted from your device to our secure servers</p>
                            </div>
                        </div>

                        <div class="flex items-start space-x-4">
                            <div class="w-12 h-12 bg-green-100 rounded-lg flex items-center justify-center flex-shrink-0">
                                <svg class="w-6 h-6 text-green-600" fill="currentColor" viewBox="0 0 24 24">
                                    <path d="M9,22A1,1 0 0,1 8,21V18H4A2,2 0 0,1 2,16V4C2,2.89 2.9,2 4,2H20A2,2 0 0,1 22,4V16A2,2 0 0,1 20,18H13.9L10.2,21.71C10,21.9 9.75,22 9.5,22V22H9Z"/>
                                </svg>
                            </div>
                            <div>
                                <h4 class="security-feature-title text-xl font-semibold mb-2">Blockchain Verified</h4>
                                <p class="security-feature-description">Immutable blockchain technology ensures vote integrity</p>
                            </div>
                        </div>

                        <div class="flex items-start space-x-4">
                            <div class="w-12 h-12 bg-purple-100 rounded-lg flex items-center justify-center flex-shrink-0">
                                <svg class="w-6 h-6 text-purple-600" fill="currentColor" viewBox="0 0 24 24">
                                    <path d="M12,15C12.81,15 13.5,14.7 14.11,14.11C14.7,13.5 15,12.81 15,12C15,11.19 14.7,10.5 14.11,9.89C13.5,9.3 12.81,9 12,9C11.19,9 10.5,9.3 9.89,9.89C9.3,10.5 9,11.19 9,12C9,12.81 9.3,13.5 9.89,14.11C10.5,14.7 11.19,15 12,15M12,2C14.21,2 16.21,2.81 17.78,4.39C19.36,5.96 20.17,7.96 20.17,10.17C20.17,12.38 19.36,14.38 17.78,15.95L12,21.75L6.22,15.95C4.64,14.38 3.83,12.38 3.83,10.17C3.83,7.96 4.64,5.96 6.22,4.39C7.79,2.81 9.79,2 12,2Z"/>
                                </svg>
                            </div>
                            <div>
                                <h4 class="security-feature-title text-xl font-semibold mb-2">Geo-Verified Voting</h4>
                                <p class="security-feature-description">Location verification ensures votes are cast from authorized areas</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div data-aos="fade-left" data-aos-delay="200">
                    <div class="bg-gradient-to-br from-blue-50 to-purple-50 p-8 rounded-2xl">
                        <div class="text-center">
                            <div class="w-20 h-20 bg-gradient-to-r from-blue-600 to-purple-600 rounded-full flex items-center justify-center mx-auto mb-6">
                                <svg class="w-10 h-10 text-white" fill="currentColor" viewBox="0 0 24 24">
                                    <path d="M9,22A1,1 0 0,1 8,21V18H4A2,2 0 0,1 2,16V4C2,2.89 2.9,2 4,2H20A2,2 0 0,1 22,4V16A2,2 0 0,1 20,18H13.9L10.2,21.71C10,21.9 9.75,22 9.5,22V22H9M18,14L12,11L6,14V4H18V14Z"/>
                                </svg>
                            </div>
                            <h3 class="certified-title text-2xl font-bold mb-4">Certified & Audited</h3>
                            <p class="certified-description mb-6">Our platform is certified by leading cybersecurity firms and undergoes regular third-party audits</p>
                            <div class="flex items-center justify-center space-x-4">
                                <div class="status status--success">SOC 2 Compliant</div>
                                <div class="status status--info">ISO 27001</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="relative z-10 bg-gray-900 text-white py-12">
        <div class="container mx-auto px-6">
            <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
                <div>
                    <div class="flex items-center space-x-2 mb-4">
                        <div class="w-8 h-8 bg-gradient-to-r from-blue-600 to-blue-700 rounded-lg flex items-center justify-center">
                            <svg class="w-5 h-5 text-white" fill="currentColor" viewBox="0 0 24 24">
                                <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-1 17.93c-3.94-.49-7-3.85-7-7.93 0-.62.08-1.21.21-1.79L9 15v1c0 1.1.9 2 2 2v1.93zm6.9-2.54c-.26-.81-1-1.39-1.9-1.39h-1v-3c0-.55-.45-1-1-1H8v-2h2c.55 0 1-.45 1-1V7h2c1.1 0 2-.9 2-2v-.41c2.93 1.19 5 4.06 5 7.41 0 2.08-.8 3.97-2.1 5.39z"/>
                            </svg>
                        </div>
                        <span class="text-xl font-bold">VoteSecure</span>
                    </div>
                    <p class="footer-description mb-4">Securing democracy through advanced technology and transparent processes.</p>
                </div>

                <div>
                    <h4 class="footer-heading font-semibold mb-4">Quick Links</h4>
                    <ul class="space-y-2">
                        <li><a href="#" class="footer-link">About Us</a></li>
                        <li><a href="#" class="footer-link">How It Works</a></li>
                        <li><a href="#" class="footer-link">Security</a></li>
                        <li><a href="#" class="footer-link">Support</a></li>
                    </ul>
                </div>

                <div>
                    <h4 class="footer-heading font-semibold mb-4">Legal</h4>
                    <ul class="space-y-2">
                        <li><a href="#" class="footer-link">Privacy Policy</a></li>
                        <li><a href="#" class="footer-link">Terms of Service</a></li>
                        <li><a href="#" class="footer-link">Cookie Policy</a></li>
                        <li><a href="#" class="footer-link">Compliance</a></li>
                    </ul>
                </div>

                <div>
                    <h4 class="footer-heading font-semibold mb-4">Contact</h4>
                    <div class="space-y-2">
                        <p class="footer-contact">support@votesecure.gov</p>
                        <p class="footer-contact">1-800-VOTE-SEC</p>
                        <p class="footer-contact">24/7 Technical Support</p>
                    </div>
                </div>
            </div>

            <div class="border-t border-gray-800 mt-8 pt-8 text-center">
                <p class="footer-copyright">&copy; 2025 VoteSecure. All rights reserved. | Securing Democracy Since 2020</p>
            </div>
        </div>
    </footer>

    <!-- Loading Modal -->
    <div id="loadingModal" class="modal fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 hidden">
        <div class="bg-white rounded-lg p-8 text-center">
            <div class="loading-spinner mx-auto mb-4"></div>
            <h3 class="text-xl font-semibold mb-2">Entering Secure Portal</h3>
            <p class="text-gray-600">Verifying security credentials...</p>
        </div>
    </div>

    <script src="js/app.js"></script>
</body>
</html>