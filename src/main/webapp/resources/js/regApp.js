/**
 * User Registration Page JavaScript
 * Handles role-based field visibility toggling
 * No form submission functionality as requested
 */

// Wait for DOM to be fully loaded
document.addEventListener('DOMContentLoaded', function() {
    // Initialize the registration form
    initializeRegistrationForm();
    
    // Setup role dropdown functionality
    setupRoleToggle();
    
    // Add form interaction enhancements
    setupFormInteractions();
});

/**
 * Initialize the registration form
 */
function initializeRegistrationForm() {
    const form = document.getElementById('registrationForm');
    
    if (!form) {
        console.error('Registration form not found');
        return;
    }
    
    // Ensure candidate fields are hidden by default
    const candidateFields = document.getElementById('candidateFields');
    if (candidateFields) {
        candidateFields.style.display = 'none';
        candidateFields.classList.remove('show');
    }
    
    // Set default role to Voter
    const roleSelect = document.getElementById('role');
    if (roleSelect) {
        roleSelect.value = 'Voter';
    }
    
    console.log('Registration form initialized');
}

/**
 * Setup role dropdown toggle functionality
 */
function setupRoleToggle() {
    const roleSelect = document.getElementById('role');
    const candidateFields = document.getElementById('candidateFields');
    
    if (!roleSelect || !candidateFields) {
        console.error('Role select or candidate fields not found');
        return;
    }
    
    // Add change event listener to role dropdown
    roleSelect.addEventListener('change', function() {
        const selectedRole = this.value;
        
        if (selectedRole === 'Candidate') {
            // Show candidate fields with animation
            showCandidateFields(candidateFields);
        } else {
            // Hide candidate fields
            hideCandidateFields(candidateFields);
        }
    });
    
    console.log('Role toggle functionality setup complete');
}

/**
 * Show candidate fields with smooth animation
 * @param {HTMLElement} candidateFields - The candidate fields container
 */
function showCandidateFields(candidateFields) {
    // First make it visible but transparent
    candidateFields.style.display = 'block';
    candidateFields.style.opacity = '0';
    candidateFields.style.transform = 'translateY(-10px)';
    
    // Force reflow
    candidateFields.offsetHeight;
    
    // Add show class and animate
    setTimeout(() => {
        candidateFields.classList.add('show');
        candidateFields.style.opacity = '1';
        candidateFields.style.transform = 'translateY(0)';
    }, 10);
    
    console.log('Candidate fields shown');
}

/**
 * Hide candidate fields with smooth animation
 * @param {HTMLElement} candidateFields - The candidate fields container
 */
function hideCandidateFields(candidateFields) {
    // Remove show class and animate out
    candidateFields.classList.remove('show');
    candidateFields.style.opacity = '0';
    candidateFields.style.transform = 'translateY(-10px)';
    
    // Hide after animation completes
    setTimeout(() => {
        candidateFields.style.display = 'none';
        
        // Clear candidate field values when hidden
        clearCandidateFields();
    }, 250); // Match CSS transition duration
    
    console.log('Candidate fields hidden');
}

/**
 * Clear all candidate field values when switching back to Voter
 */
function clearCandidateFields() {
    const candidateFieldIds = ['party', 'constituency', 'bio', 'partyLogo', 'profilePicture'];
    
    candidateFieldIds.forEach(fieldId => {
        const field = document.getElementById(fieldId);
        if (field) {
            field.value = '';
            
            // Remove any validation classes
            field.classList.remove('is-valid', 'is-invalid');
        }
    });
    
    console.log('Candidate fields cleared');
}

/**
 * Setup form interaction enhancements
 */
function setupFormInteractions() {
    // Add hover effects and focus management
    setupFieldHoverEffects();
    
    // Setup keyboard navigation
    setupKeyboardNavigation();
    
    // Setup field validation visual feedback
    setupValidationFeedback();
}

/**
 * Add hover effects to form fields
 */
function setupFieldHoverEffects() {
    const formControls = document.querySelectorAll('.form-control:not([readonly]):not([disabled]), select.form-control');
    
    formControls.forEach(control => {
        control.addEventListener('mouseenter', function() {
            if (!this.matches(':focus')) {
                const inputGroup = this.closest('.input-group');
                if (inputGroup) {
                    inputGroup.classList.add('hover');
                }
            }
        });
        
        control.addEventListener('mouseleave', function() {
            const inputGroup = this.closest('.input-group');
            if (inputGroup) {
                inputGroup.classList.remove('hover');
            }
        });
    });
}

/**
 * Setup keyboard navigation enhancements
 */
function setupKeyboardNavigation() {
    const form = document.getElementById('registrationForm');
    
    form.addEventListener('keydown', function(e) {
        // Handle Enter key to move to next field
        if (e.key === 'Enter') {
            const activeElement = document.activeElement;
            
            // Skip for textareas and submit buttons
            if (activeElement.tagName === 'TEXTAREA' || activeElement.type === 'submit') {
                return;
            }
            
            // If it's an input or select, move to next field
            if (activeElement.tagName === 'INPUT' || activeElement.tagName === 'SELECT') {
                e.preventDefault();
                moveToNextField(activeElement);
            }
        }
        
        // Handle Escape key to blur current field
        if (e.key === 'Escape') {
            document.activeElement.blur();
        }
    });
}

/**
 * Move focus to the next visible form field
 * @param {HTMLElement} currentField - Current focused field
 */
function moveToNextField(currentField) {
    const formElements = Array.from(document.querySelectorAll('input:not([readonly]):not([disabled]), select, textarea'));
    
    // Filter out hidden fields (in case candidate fields are hidden)
    const visibleElements = formElements.filter(element => {
        const rect = element.getBoundingClientRect();
        return rect.width > 0 && rect.height > 0;
    });
    
    const currentIndex = visibleElements.indexOf(currentField);
    
    if (currentIndex > -1 && currentIndex < visibleElements.length - 1) {
        visibleElements[currentIndex + 1].focus();
    }
}

/**
 * Setup visual feedback for form validation
 */
function setupValidationFeedback() {
    const requiredFields = document.querySelectorAll('[required]');
    
    requiredFields.forEach(field => {
        // Add blur event for validation feedback
        field.addEventListener('blur', function() {
            if (this.value.trim() !== '') {
                validateField(this);
            }
        });
        
        // Clear validation state on input
        field.addEventListener('input', function() {
            this.classList.remove('is-invalid');
        });
    });
}

/**
 * Simple field validation with visual feedback
 * @param {HTMLElement} field - The field to validate
 */
function validateField(field) {
    const isValid = field.checkValidity();
    
    // Remove existing validation classes
    field.classList.remove('is-valid', 'is-invalid');
    
    if (isValid) {
        field.classList.add('is-valid');
    } else {
        field.classList.add('is-invalid');
    }
}

/**
 * Get current role selection
 * @returns {string} - Selected role value
 */
function getCurrentRole() {
    const roleSelect = document.getElementById('role');
    return roleSelect ? roleSelect.value : 'Voter';
}

/**
 * Check if candidate fields are currently visible
 * @returns {boolean} - True if candidate fields are shown
 */
function areCandidateFieldsVisible() {
    const candidateFields = document.getElementById('candidateFields');
    return candidateFields && candidateFields.style.display !== 'none';
}

/**
 * Utility function to get all form data (for debugging)
 * @returns {Object} - Form data object
 */
function getFormData() {
    const form = document.getElementById('registrationForm');
    const formData = new FormData(form);
    const data = {};
    
    for (let [key, value] of formData.entries()) {
        data[key] = value;
    }
    
    return data;
}

// Export functions for potential external use or debugging
window.RegistrationForm = {
    getCurrentRole,
    areCandidateFieldsVisible,
    getFormData,
    showCandidateFields: () => {
        const candidateFields = document.getElementById('candidateFields');
        if (candidateFields) showCandidateFields(candidateFields);
    },
    hideCandidateFields: () => {
        const candidateFields = document.getElementById('candidateFields');
        if (candidateFields) hideCandidateFields(candidateFields);
    }
};

// Console logging for debugging
console.log('User Registration Page JavaScript loaded successfully');
console.log('Note: Submit button has no functionality as requested - design only');