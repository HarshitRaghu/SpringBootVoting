// Wait for DOM to be fully loaded
document.addEventListener('DOMContentLoaded', function() {
    // Initialize the form
    initializeForm();
    
    // Add form validation styling
    setupFormValidation();
    
    // Add interactive enhancements
    setupInteractiveElements();
    
    // Setup date input formatting
    setupDateInputFormatting();
});

/**
 * Initialize form with default values and setup
 */
function initializeForm() {
    const form = document.getElementById('updateElectionForm');
    
    if (!form) {
        console.error('Update election form not found');
        return;
    }
    
    // Form is ready
    console.log('Update Election form initialized');
    
    // Add form submission prevention (since we don't want actual submission)
    form.addEventListener('submit', function(e) {
        e.preventDefault();
        console.log('Form submission prevented - Update button has no functionality');
    });
    
    // Setup update button click handler
    const updateButton = document.getElementById('updateButton');
    if (updateButton) {
        updateButton.addEventListener('click', function(e) {
            e.preventDefault();
            console.log('Update button clicked - No functionality as requested');
            
            // Add visual feedback
            showButtonFeedback(this);
        });
    }
}

/**
 * Setup form validation with visual feedback
 */
function setupFormValidation() {
    const form = document.getElementById('updateElectionForm');
    const formFields = form.querySelectorAll('.form-control');
    
    formFields.forEach(field => {
        // Add blur event listener for validation feedback
        field.addEventListener('blur', function() {
            validateField(this);
        });
        
        // Add input event listener for clearing validation states
        field.addEventListener('input', function() {
            clearValidationState(this);
        });
        
        // Add focus event listener for focus management
        field.addEventListener('focus', function() {
            handleFieldFocus(this);
        });
    });
}

/**
 * Validate individual form field and show visual feedback
 * @param {HTMLElement} field - The form field to validate
 */
function validateField(field) {
    const fieldValue = field.value.trim();
    
    // Remove existing validation classes
    field.classList.remove('is-valid', 'is-invalid');
    
    if (fieldValue === '') {
        // Field is empty, don't show validation state on blur
        return;
    }
    
    // Basic validation logic for visual feedback
    let isValid = true;
    
    switch (field.id) {
        case 'electionId':
            isValid = fieldValue.length >= 3;
            break;
        case 'electionName':
            isValid = fieldValue.length >= 2;
            break;
        case 'electionDate':
            isValid = validateDateInput(field);
            break;
        case 'position':
            isValid = fieldValue.length >= 2;
            break;
        default:
            isValid = fieldValue.length > 0;
    }
    
    if (isValid) {
        field.classList.add('is-valid');
    } else {
        field.classList.add('is-invalid');
    }
}

/**
 * Clear validation state from field during input
 * @param {HTMLElement} field - The form field to clear
 */
function clearValidationState(field) {
    // Clear invalid state when user starts typing
    if (field.classList.contains('is-invalid')) {
        field.classList.remove('is-invalid');
    }
}

/**
 * Handle field focus events
 * @param {HTMLElement} field - The focused field
 */
function handleFieldFocus(field) {
    // Add subtle visual feedback on focus
    field.style.transform = 'scale(1.01)';
    
    // Reset transform after focus
    field.addEventListener('blur', function resetTransform() {
        field.style.transform = '';
        field.removeEventListener('blur', resetTransform);
    }, { once: true });
}

/**
 * Validate date input in MM/DD/YYYY format
 * @param {HTMLElement} dateField - The date input field
 * @returns {boolean} - True if valid
 */
function validateDateInput(dateField) {
    const dateValue = dateField.value.trim();
    
    // Check format with regex
    const datePattern = /^(0[1-9]|1[0-2])\/(0[1-9]|[12][0-9]|3[01])\/\d{4}$/;
    
    if (!datePattern.test(dateValue)) {
        updateInvalidFeedback(dateField, 'Please enter date in MM/DD/YYYY format.');
        return false;
    }
    
    // Parse and validate actual date
    const [month, day, year] = dateValue.split('/').map(num => parseInt(num, 10));
    const inputDate = new Date(year, month - 1, day);
    
    // Check if date is valid
    if (inputDate.getFullYear() !== year || 
        inputDate.getMonth() !== month - 1 || 
        inputDate.getDate() !== day) {
        updateInvalidFeedback(dateField, 'Please enter a valid date.');
        return false;
    }
    
    // Check if date is not in the past
    const today = new Date();
    today.setHours(0, 0, 0, 0);
    inputDate.setHours(0, 0, 0, 0);
    
    if (inputDate < today) {
        updateInvalidFeedback(dateField, 'Election date cannot be in the past.');
        return false;
    }
    
    // Reset to default feedback message
    updateInvalidFeedback(dateField, 'Please enter a valid date in MM/DD/YYYY format.');
    return true;
}

/**
 * Update invalid feedback message
 * @param {HTMLElement} field - The form field
 * @param {string} message - The feedback message
 */
function updateInvalidFeedback(field, message) {
    const invalidFeedback = field.parentNode.querySelector('.invalid-feedback');
    if (invalidFeedback) {
        invalidFeedback.textContent = message;
    }
}

/**
 * Setup date input formatting and validation
 */
function setupDateInputFormatting() {
    const dateField = document.getElementById('electionDate');
    
    if (dateField) {
        dateField.addEventListener('input', function(e) {
            formatDateInput(this);
        });
        
        dateField.addEventListener('keydown', function(e) {
            handleDateKeydown(e, this);
        });
        
        dateField.addEventListener('paste', function(e) {
            setTimeout(() => formatDateInput(this), 0);
        });
    }
}

/**
 * Format date input as user types
 * @param {HTMLElement} field - The date input field
 */
function formatDateInput(field) {
    const cursorPosition = field.selectionStart;
    let value = field.value.replace(/\D/g, ''); // Remove non-digits
    
    // Limit to 8 digits (MMDDYYYY)
    if (value.length > 8) {
        value = value.slice(0, 8);
    }
    
    // Add slashes
    if (value.length >= 2) {
        value = value.slice(0, 2) + '/' + value.slice(2);
    }
    if (value.length >= 5) {
        value = value.slice(0, 5) + '/' + value.slice(5);
    }
    
    field.value = value;
    
    // Adjust cursor position
    let newCursorPosition = cursorPosition;
    if (cursorPosition === 2 && value.length === 3) {
        newCursorPosition = 3;
    } else if (cursorPosition === 5 && value.length === 6) {
        newCursorPosition = 6;
    }
    
    field.setSelectionRange(newCursorPosition, newCursorPosition);
}

/**
 * Handle special keydown events for date input
 * @param {Event} e - The keydown event
 * @param {HTMLElement} field - The date input field
 */
function handleDateKeydown(e, field) {
    // Allow: backspace, delete, tab, escape, enter
    if ([8, 9, 27, 13, 46].indexOf(e.keyCode) !== -1 ||
        // Allow: Ctrl+A, Ctrl+C, Ctrl+V, Ctrl+X
        (e.keyCode === 65 && e.ctrlKey === true) ||
        (e.keyCode === 67 && e.ctrlKey === true) ||
        (e.keyCode === 86 && e.ctrlKey === true) ||
        (e.keyCode === 88 && e.ctrlKey === true) ||
        // Allow: home, end, left, right, down, up
        (e.keyCode >= 35 && e.keyCode <= 40)) {
        return;
    }
    
    // Ensure that it is a number and stop the keypress
    if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
        e.preventDefault();
    }
}

/**
 * Setup interactive elements and UI enhancements
 */
function setupInteractiveElements() {
    // Add hover effects to form fields
    setupFieldHoverEffects();
    
    // Add focus management
    setupFocusManagement();
    
    // Add keyboard navigation enhancements
    setupKeyboardNavigation();
    
    // Setup election ID formatting
    setupElectionIdFormatting();
}

/**
 * Add hover effects to form fields
 */
function setupFieldHoverEffects() {
    const formControls = document.querySelectorAll('.form-control');
    
    formControls.forEach(control => {
        control.addEventListener('mouseenter', function() {
            if (!this.matches(':focus')) {
                this.style.borderColor = 'var(--color-primary-hover)';
            }
        });
        
        control.addEventListener('mouseleave', function() {
            if (!this.matches(':focus')) {
                this.style.borderColor = '';
            }
        });
    });
}

/**
 * Setup focus management for better accessibility
 */
function setupFocusManagement() {
    const firstInput = document.getElementById('electionId');
    
    // Focus first input field when page loads (after a short delay)
    setTimeout(() => {
        if (firstInput && (!document.activeElement || document.activeElement === document.body)) {
            firstInput.focus();
        }
    }, 500);
}

/**
 * Setup keyboard navigation enhancements
 */
function setupKeyboardNavigation() {
    const form = document.getElementById('updateElectionForm');
    
    form.addEventListener('keydown', function(e) {
        // Enter key handling
        if (e.key === 'Enter') {
            const activeElement = document.activeElement;
            
            // If we're in a text input, move to next field
            if (activeElement.tagName === 'INPUT' && activeElement.type !== 'button') {
                e.preventDefault();
                moveToNextField(activeElement);
            }
        }
        
        // Escape key handling - blur current field
        if (e.key === 'Escape') {
            document.activeElement.blur();
        }
    });
}

/**
 * Move focus to the next form field
 * @param {HTMLElement} currentField - Current focused field
 */
function moveToNextField(currentField) {
    const formElements = Array.from(document.querySelectorAll('input, button'));
    const currentIndex = formElements.indexOf(currentField);
    
    if (currentIndex > -1 && currentIndex < formElements.length - 1) {
        formElements[currentIndex + 1].focus();
    }
}

/**
 * Auto-format election ID as user types
 */
function setupElectionIdFormatting() {
    const electionIdField = document.getElementById('electionId');
    
    if (electionIdField) {
        electionIdField.addEventListener('input', function() {
            const cursorPosition = this.selectionStart;
            const originalLength = this.value.length;
            
            this.value = formatElectionId(this.value);
            
            // Maintain cursor position
            const newLength = this.value.length;
            const newPosition = cursorPosition + (newLength - originalLength);
            this.setSelectionRange(newPosition, newPosition);
        });
    }
}

/**
 * Format election ID to standard format
 * @param {string} id - Election ID to format
 * @returns {string} - Formatted election ID
 */
function formatElectionId(id) {
    return id.toUpperCase().replace(/[^A-Z0-9-]/g, '');
}

/**
 * Show visual feedback when button is clicked
 * @param {HTMLElement} button - The button element
 */
function showButtonFeedback(button) {
    // Add loading state temporarily for visual feedback
    button.classList.add('loading');
    button.disabled = true;
    
    // Remove loading state after a short delay
    setTimeout(() => {
        button.classList.remove('loading');
        button.disabled = false;
    }, 1000);
}

/**
 * Get form data (for future use or debugging)
 * @returns {Object} - Form data object
 */
function getFormData() {
    const form = document.getElementById('updateElectionForm');
    const formData = new FormData(form);
    const data = {};
    
    for (let [key, value] of formData.entries()) {
        data[key] = value;
    }
    
    return data;
}

/**
 * Check if form has any values
 * @returns {boolean} - True if form has content
 */
function hasFormContent() {
    const form = document.getElementById('updateElectionForm');
    const inputs = form.querySelectorAll('.form-control');
    
    for (let input of inputs) {
        if (input.value.trim() !== '') {
            return true;
        }
    }
    
    return false;
}

// Export functions for potential external use
window.ElectionUpdateForm = {
    getFormData,
    hasFormContent,
    formatElectionId,
    validateField,
    validateDateInput
};

// Add some console logging for debugging
console.log('Update Election Page JavaScript loaded successfully');
console.log('Election ID field is now fully editable with write permissions');
console.log('Date field now accepts text input in MM/DD/YYYY format');
console.log('Note: Update button has no functionality as requested');