// Registration Form JavaScript
document.addEventListener('DOMContentLoaded', function() {
    // Get form elements
    const roleSelect = document.getElementById('role');
    const candidateSection = document.getElementById('candidateSection');
    const candidateFields = {
        partyName: document.getElementById('partyName'),
        constituency: document.getElementById('constituency'),
        bio: document.getElementById('bio')
    };

    // Initialize form state
    initializeForm();

    // Event listeners
    roleSelect.addEventListener('change', handleRoleChange);
    
    // Add input validation listeners
    addValidationListeners();

    /**
     * Initialize form state on page load
     */
    function initializeForm() {
        // Hide candidate section by default
        hideCandidateSection();
        
        // Set initial role state
        const initialRole = roleSelect.value;
        if (initialRole === 'CANDIDATE') {
            showCandidateSection();
        }
    }

    /**
     * Handle role selection change
     */
    function handleRoleChange() {
        const selectedRole = roleSelect.value;
        
        if (selectedRole === 'CANDIDATE') {
            showCandidateSection();
        } else {
            hideCandidateSection();
        }
    }

    /**
     * Show candidate-specific fields
     */
    function showCandidateSection() {
        // Remove hidden class to trigger CSS transition
        candidateSection.classList.remove('hidden');
        
        // Make candidate fields required
        Object.values(candidateFields).forEach(field => {
            if (field) {
                field.setAttribute('required', 'required');
                field.removeAttribute('disabled');
            }
        });

        // Improve accessibility
        candidateSection.setAttribute('aria-hidden', 'false');
        
        // Focus on first candidate field after transition
        setTimeout(() => {
            if (candidateFields.partyName) {
                candidateFields.partyName.focus();
            }
        }, 300);
    }

    /**
     * Hide candidate-specific fields
     */
    function hideCandidateSection() {
        // Add hidden class to trigger CSS transition
        candidateSection.classList.add('hidden');
        
        // Remove required attribute and clear values
        Object.values(candidateFields).forEach(field => {
            if (field) {
                field.removeAttribute('required');
                field.value = '';
                field.classList.remove('error');
                
                // Remove any validation messages
                const errorMessage = field.parentNode.querySelector('.error-message');
                if (errorMessage) {
                    errorMessage.remove();
                }
            }
        });

        // Improve accessibility
        candidateSection.setAttribute('aria-hidden', 'true');
    }

    /**
     * Add validation listeners for better UX
     */
    function addValidationListeners() {
        const allInputs = document.querySelectorAll('.form-control');
        
        allInputs.forEach(input => {
            // Real-time validation on blur
            input.addEventListener('blur', function() {
                validateField(this);
            });

            // Clear validation on input
            input.addEventListener('input', function() {
                clearFieldValidation(this);
            });
        });

        // Special validation for email
        const emailField = document.getElementById('email');
        if (emailField) {
            emailField.addEventListener('blur', function() {
                validateEmail(this);
            });
        }

        // Special validation for password
        const passwordField = document.getElementById('password');
        if (passwordField) {
            passwordField.addEventListener('input', function() {
                validatePassword(this);
            });
        }

        // Special validation for date of birth
        const dobField = document.getElementById('dateOfBirth');
        if (dobField) {
            dobField.addEventListener('blur', function() {
                validateAge(this);
            });
        }
    }

    /**
     * Validate individual field
     */
    function validateField(field) {
        const value = field.value.trim();
        const isRequired = field.hasAttribute('required');
        
        // Check if field is in visible section
        const candidateSection = document.getElementById('candidateSection');
        const isInCandidateSection = candidateSection.contains(field);
        const isCandidateSectionVisible = !candidateSection.classList.contains('hidden');
        
        // Skip validation for candidate fields when section is hidden
        if (isInCandidateSection && !isCandidateSectionVisible) {
            return true;
        }

        if (isRequired && !value) {
            showFieldError(field, 'This field is required');
            return false;
        }

        clearFieldValidation(field);
        return true;
    }

    /**
     * Validate email format
     */
    function validateEmail(emailField) {
        const email = emailField.value.trim();
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        
        if (email && !emailRegex.test(email)) {
            showFieldError(emailField, 'Please enter a valid email address');
            return false;
        }
        
        return validateField(emailField);
    }

    /**
     * Validate password strength
     */
    function validatePassword(passwordField) {
        const password = passwordField.value;
        
        if (password && password.length < 8) {
            showFieldError(passwordField, 'Password must be at least 8 characters long');
            return false;
        }
        
        return validateField(passwordField);
    }

    /**
     * Validate age (must be 18 or older)
     */
    function validateAge(dobField) {
        const dateOfBirth = new Date(dobField.value);
        const today = new Date();
        const age = today.getFullYear() - dateOfBirth.getFullYear();
        const monthDiff = today.getMonth() - dateOfBirth.getMonth();
        
        if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < dateOfBirth.getDate())) {
            age--;
        }
        
        if (dobField.value && age < 18) {
            showFieldError(dobField, 'You must be at least 18 years old to register');
            return false;
        }
        
        return validateField(dobField);
    }

    /**
     * Show field validation error
     */
    function showFieldError(field, message) {
        clearFieldValidation(field);
        
        field.classList.add('error');
        
        const errorDiv = document.createElement('div');
        errorDiv.className = 'error-message';
        errorDiv.textContent = message;
        errorDiv.style.color = 'var(--color-error)';
        errorDiv.style.fontSize = 'var(--font-size-xs)';
        errorDiv.style.marginTop = 'var(--space-4)';
        
        field.parentNode.appendChild(errorDiv);
    }

    /**
     * Clear field validation
     */
    function clearFieldValidation(field) {
        field.classList.remove('error');
        
        const existingError = field.parentNode.querySelector('.error-message');
        if (existingError) {
            existingError.remove();
        }
    }

    /**
     * Utility function to animate elements
     */
    function animateElement(element, animation) {
        element.style.animation = animation;
        element.addEventListener('animationend', function() {
            element.style.animation = '';
        }, { once: true });
    }

    /**
     * Handle form accessibility
     */
    function updateFormAccessibility() {
        const form = document.getElementById('registrationForm');
        
        // Update ARIA labels based on current state
        const roleValue = roleSelect.value;
        if (roleValue === 'candidate') {
            form.setAttribute('aria-describedby', 'form-description candidate-description');
        } else {
            form.setAttribute('aria-describedby', 'form-description');
        }
    }

    /**
     * Enhance keyboard navigation
     */
    function enhanceKeyboardNavigation() {
        const form = document.getElementById('registrationForm');
        
        form.addEventListener('keydown', function(e) {
            // Allow Enter to move to next field instead of submitting
            if (e.key === 'Enter' && e.target.tagName !== 'TEXTAREA' && e.target.type !== 'submit') {
                e.preventDefault();
                
                const formElements = Array.from(form.elements);
                const visibleElements = formElements.filter(el => 
                    el.type !== 'submit' && 
                    !el.disabled && 
                    el.offsetParent !== null
                );
                
                const currentIndex = visibleElements.indexOf(e.target);
                const nextIndex = currentIndex + 1;
                
                if (nextIndex < visibleElements.length) {
                    visibleElements[nextIndex].focus();
                }
            }
        });
    }

    // Initialize additional features
    enhanceKeyboardNavigation();
    updateFormAccessibility();

    // Update accessibility when role changes
    roleSelect.addEventListener('change', updateFormAccessibility);
});