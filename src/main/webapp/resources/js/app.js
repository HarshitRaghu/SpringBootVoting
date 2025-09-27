// VoteSecure Landing Page JavaScript
document.addEventListener('DOMContentLoaded', function() {
    // Initialize AOS (Animate On Scroll)
    AOS.init({
        duration: 800,
        easing: 'ease-out-cubic',
        once: true,
        offset: 100,
        delay: 100
    });

    // Page load animation
    document.body.classList.add('page-transition');

    // Create and add scroll progress indicator
    createScrollIndicator();

    // Initialize smooth scrolling for navigation links
    initializeSmoothScrolling();

    // Initialize button interactions
    initializeButtonInteractions();

    // Initialize stats counter animation
    initializeStatsCounters();

    // Initialize feature card interactions
    initializeFeatureCards();

    // Initialize floating animation enhancements
    initializeFloatingAnimations();

    // Initialize header scroll effects
    initializeHeaderEffects();
});

// Create scroll progress indicator
function createScrollIndicator() {
    const scrollIndicator = document.createElement('div');
    scrollIndicator.className = 'scroll-indicator';
    document.body.appendChild(scrollIndicator);

    window.addEventListener('scroll', updateScrollIndicator);
}

// Update scroll progress indicator
function updateScrollIndicator() {
    const winScroll = document.body.scrollTop || document.documentElement.scrollTop;
    const height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
    const scrolled = (winScroll / height) * 100;
    document.querySelector('.scroll-indicator').style.width = scrolled + '%';
}

// Initialize smooth scrolling for navigation links
function initializeSmoothScrolling() {
    const navLinks = document.querySelectorAll('nav a[href^="#"]');
    
    navLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            const targetId = this.getAttribute('href').substring(1);
            const targetSection = document.getElementById(targetId);
            
            if (targetSection) {
                const headerHeight = document.querySelector('header').offsetHeight;
                const targetPosition = targetSection.offsetTop - headerHeight - 20;
                
                window.scrollTo({
                    top: targetPosition,
                    behavior: 'smooth'
                });
            }
        });
    });
}

// Initialize button interactions
function initializeButtonInteractions() {
    // Learn More button smooth scroll to features
    const learnMoreBtn = document.querySelector('.btn--outline');
    if (learnMoreBtn && learnMoreBtn.textContent.trim() === 'Learn More') {
        learnMoreBtn.addEventListener('click', function(e) {
            e.preventDefault();
            const featuresSection = document.getElementById('features');
            if (featuresSection) {
                const headerHeight = document.querySelector('header').offsetHeight;
                const targetPosition = featuresSection.offsetTop - headerHeight - 20;
                
                window.scrollTo({
                    top: targetPosition,
                    behavior: 'smooth'
                });
            }
        });
    }
}

// Show loading modal with animation
function showLoadingModal() {
    const modal = document.getElementById('loadingModal');
    modal.classList.remove('hidden');
    setTimeout(() => {
        modal.classList.add('show');
    }, 10);
    
    // Prevent scrolling
    document.body.style.overflow = 'hidden';
}

// Hide loading modal
function hideLoadingModal() {
    const modal = document.getElementById('loadingModal');
    modal.classList.remove('show');
    setTimeout(() => {
        modal.classList.add('hidden');
        document.body.style.overflow = '';
    }, 300);
}

// Show voting portal modal (improved version)
function showVotingPortalModal() {
    // Remove any existing modal first
    const existingModal = document.getElementById('votingPortalModal');
    if (existingModal) {
        existingModal.remove();
    }

    // Create modal instead of full page overlay
    const modal = document.createElement('div');
    modal.id = 'votingPortalModal';
    modal.className = 'fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50';
    modal.style.opacity = '0';
    modal.innerHTML = `
        <div class="bg-white rounded-2xl p-8 text-center max-w-md mx-4 transform scale-95" id="votingPortalContent">
            <div class="w-16 h-16 bg-green-500 rounded-full flex items-center justify-center mx-auto mb-6">
                <svg class="w-8 h-8 text-white" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M21,7L9,19L3.5,13.5L4.91,12.09L9,16.17L19.59,5.59L21,7Z"/>
                </svg>
            </div>
            <h2 class="text-2xl font-bold text-gray-800 mb-4">Access Granted</h2>
            <p class="text-gray-600 mb-6">You have successfully accessed the VoteSecure portal. In a real implementation, you would now be redirected to the secure voting interface.</p>
            <div class="space-y-3">
                <button onclick="closeVotingPortalModal()" class="btn btn--primary btn--full-width">
                    Continue to Dashboard
                </button>
                <button onclick="closeVotingPortalModal()" class="btn btn--outline btn--full-width">
                    Return to Homepage
                </button>
            </div>
        </div>
    `;
    
    document.body.appendChild(modal);
    
    // Force a reflow to ensure the modal is added to DOM
    modal.offsetHeight;
    
    // Animate in with proper timing
    modal.style.transition = 'opacity 0.3s ease';
    modal.style.opacity = '1';
    
    const content = document.getElementById('votingPortalContent');
    content.style.transition = 'transform 0.3s ease';
    content.style.transform = 'scale(1)';
    
    // Prevent body scrolling
    document.body.style.overflow = 'hidden';
    
    // Close on ESC key
    document.addEventListener('keydown', handleModalEscape);
    
    // Close on backdrop click
    modal.addEventListener('click', function(e) {
        if (e.target === modal) {
            closeVotingPortalModal();
        }
    });
}

// Close voting portal modal
function closeVotingPortalModal() {
    const modal = document.getElementById('votingPortalModal');
    if (modal) {
        const content = document.getElementById('votingPortalContent');
        
        // Animate out
        modal.style.opacity = '0';
        content.style.transform = 'scale(0.95)';
        
        setTimeout(() => {
            modal.remove();
            document.body.style.overflow = '';
            document.removeEventListener('keydown', handleModalEscape);
        }, 300);
    }
}

// Handle ESC key for modal
function handleModalEscape(e) {
    if (e.key === 'Escape') {
        const loadingModal = document.getElementById('loadingModal');
        const votingPortalModal = document.getElementById('votingPortalModal');
        
        if (!loadingModal.classList.contains('hidden')) {
            hideLoadingModal();
        } else if (votingPortalModal) {
            closeVotingPortalModal();
        }
    }
}

// Make closeVotingPortalModal available globally
window.closeVotingPortalModal = closeVotingPortalModal;

// Initialize stats counter animation
function initializeStatsCounters() {
    const statsNumbers = document.querySelectorAll('.text-3xl.font-bold.text-blue-600');
    
    const animateNumber = (element, target, duration = 2000) => {
        const start = 0;
        const increment = target / (duration / 16);
        let current = start;
        
        const timer = setInterval(() => {
            current += increment;
            if (current >= target) {
                current = target;
                clearInterval(timer);
            }
            
            // Handle different number formats
            if (target === 2000000) {
                element.textContent = Math.floor(current / 1000000) + 'M+';
            } else if (target === 99.9) {
                element.textContent = (current).toFixed(1) + '%';
            } else if (target === 256) {
                element.textContent = Math.floor(current) + '-bit';
            } else if (target === 24) {
                element.textContent = Math.floor(current) + '/7';
            }
        }, 16);
    };

    // Intersection Observer to trigger animation when in view
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const element = entry.target;
                const text = element.textContent;
                
                if (text.includes('M+')) {
                    animateNumber(element, 2000000);
                } else if (text.includes('%')) {
                    animateNumber(element, 99.9);
                } else if (text.includes('-bit')) {
                    animateNumber(element, 256);
                } else if (text.includes('/7')) {
                    animateNumber(element, 24);
                }
                
                observer.unobserve(element);
            }
        });
    }, { threshold: 0.5 });

    statsNumbers.forEach(stat => {
        observer.observe(stat);
    });
}

// Initialize feature card interactions
function initializeFeatureCards() {
    const featureCards = document.querySelectorAll('.feature-card');
    
    featureCards.forEach((card, index) => {
        card.addEventListener('mouseenter', function() {
            // Add subtle tilt effect
            this.style.transform = 'translateY(-8px) scale(1.02) rotate(0.5deg)';
        });
        
        card.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0) scale(1) rotate(0deg)';
        });
        
        // Add click interaction
        card.addEventListener('click', function() {
            const title = this.querySelector('h3').textContent;
            showAlert(`Learn more about our ${title} feature in the secure portal.`, 'info');
        });
        
        // Add keyboard support
        card.setAttribute('tabindex', '0');
        card.setAttribute('role', 'button');
        card.setAttribute('aria-label', `Learn more about ${this.querySelector('h3').textContent}`);
        
        card.addEventListener('keydown', function(e) {
            if (e.key === 'Enter' || e.key === ' ') {
                e.preventDefault();
                this.click();
            }
        });
    });
}

// Initialize floating animation enhancements
function initializeFloatingAnimations() {
    // Add random delays and directions to shapes
    const shapes = document.querySelectorAll('.shape');
    
    shapes.forEach((shape, index) => {
        const randomDelay = Math.random() * 10;
        const randomDuration = 20 + Math.random() * 15;
        const randomLeft = 10 + Math.random() * 80;
        
        shape.style.animationDelay = `-${randomDelay}s`;
        shape.style.animationDuration = `${randomDuration}s`;
        shape.style.left = `${randomLeft}%`;
        
        // Add random horizontal movement
        shape.style.setProperty('--random-x', `${(Math.random() - 0.5) * 100}px`);
    });
}

// Initialize header scroll effects
function initializeHeaderEffects() {
    const header = document.querySelector('header');
    let lastScrollY = window.scrollY;
    
    window.addEventListener('scroll', () => {
        const currentScrollY = window.scrollY;
        
        // Add background opacity based on scroll
        const opacity = Math.min(currentScrollY / 100, 1);
        header.style.backgroundColor = `rgba(255, 255, 255, ${0.9 + opacity * 0.1})`;
        
        // Hide/show header based on scroll direction
        if (currentScrollY > lastScrollY && currentScrollY > 100) {
            header.style.transform = 'translateY(-100%)';
        } else {
            header.style.transform = 'translateY(0)';
        }
        
        lastScrollY = currentScrollY;
    });
}

// Utility function to show alerts
function showAlert(message, type = 'info') {
    const alert = document.createElement('div');
    alert.className = `fixed top-4 right-4 z-50 p-4 rounded-lg shadow-lg max-w-sm`;
    
    const colors = {
        info: 'bg-blue-500 text-white',
        success: 'bg-green-500 text-white',
        warning: 'bg-yellow-500 text-black',
        error: 'bg-red-500 text-white'
    };
    
    alert.className += ` ${colors[type]}`;
    alert.innerHTML = `
        <div class="flex items-center space-x-2">
            <div class="flex-1">${message}</div>
            <button onclick="this.parentElement.parentElement.remove()" class="text-current hover:opacity-70">
                <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"/>
                </svg>
            </button>
        </div>
    `;
    
    document.body.appendChild(alert);
    
    // Animate in
    alert.style.opacity = '0';
    alert.style.transform = 'translateX(100%)';
    setTimeout(() => {
        alert.style.transition = 'all 0.3s ease';
        alert.style.opacity = '1';
        alert.style.transform = 'translateX(0)';
    }, 10);
    
    // Auto remove after 5 seconds
    setTimeout(() => {
        if (alert.parentElement) {
            alert.style.opacity = '0';
            alert.style.transform = 'translateX(100%)';
            setTimeout(() => alert.remove(), 300);
        }
    }, 5000);
}

// Keyboard navigation enhancements
document.addEventListener('keydown', function(e) {
    // ESC key closes modals
    if (e.key === 'Escape') {
        handleModalEscape(e);
    }
    
    // Enter key on focused buttons
    if (e.key === 'Enter' && document.activeElement.classList.contains('btn')) {
        document.activeElement.click();
    }
});

// Handle reduced motion preference
if (window.matchMedia('(prefers-reduced-motion: reduce)').matches) {
    // Disable background animations for users who prefer reduced motion
    const backgroundAnimation = document.querySelector('.background-animation');
    if (backgroundAnimation) {
        backgroundAnimation.style.animation = 'none';
    }
    
    const shapes = document.querySelectorAll('.shape');
    shapes.forEach(shape => {
        shape.style.animation = 'none';
        shape.style.opacity = '0.1';
    });
}

// Add scroll-based parallax effect (subtle)
window.addEventListener('scroll', function() {
    const scrolled = window.pageYOffset;
    const rate = scrolled * -0.5;
    
    const shapes = document.querySelectorAll('.shape');
    shapes.forEach((shape, index) => {
        const speed = 0.5 + (index * 0.1);
        shape.style.transform = `translateY(${rate * speed}px)`;
    });
});

// Performance optimization: throttle scroll events
function throttle(func, limit) {
    let inThrottle;
    return function() {
        const args = arguments;
        const context = this;
        if (!inThrottle) {
            func.apply(context, args);
            inThrottle = true;
            setTimeout(() => inThrottle = false, limit);
        }
    };
}

// Apply throttling to scroll events
const throttledScroll = throttle(function() {
    updateScrollIndicator();
}, 16); // ~60fps

window.addEventListener('scroll', throttledScroll);

// Add loading state management
window.addEventListener('load', function() {
    // Hide any loading indicators
    document.body.classList.add('loaded');
    
    // Trigger initial animations
    setTimeout(() => {
        const heroSection = document.querySelector('section');
        if (heroSection) {
            heroSection.classList.add('animate-in');
        }
    }, 100);
});

// Error handling for missing elements
function safeQuerySelector(selector, callback) {
    const element = document.querySelector(selector);
    if (element && callback) {
        callback(element);
    }
    return element;
}

// Enhanced accessibility
function initializeAccessibility() {
    // Add skip navigation link
    const skipLink = document.createElement('a');
    skipLink.href = '#features';
    skipLink.textContent = 'Skip to main content';
    skipLink.className = 'sr-only focus:not-sr-only focus:absolute focus:top-2 focus:left-2 bg-blue-600 text-white p-2 rounded z-50';
    document.body.insertBefore(skipLink, document.body.firstChild);
    
    // Add proper ARIA labels
    const buttons = document.querySelectorAll('.btn');
    buttons.forEach(button => {
        if (!button.getAttribute('aria-label') && !button.textContent.trim()) {
            button.setAttribute('aria-label', 'Interactive button');
        }
    });
    
    // Add main content landmark
    const featuresSection = document.getElementById('features');
    if (featuresSection) {
        featuresSection.setAttribute('role', 'main');
        featuresSection.setAttribute('aria-label', 'Main content');
    }
}

// Initialize accessibility features
initializeAccessibility();