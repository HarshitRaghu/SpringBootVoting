/**
 * User Registration Page JavaScript
 * Handles role-based field visibility toggling & basic validation
 */

// Wait for DOM to be fully loaded
document.addEventListener('DOMContentLoaded', function() {
    initializeRegistrationForm();
    setupRoleToggle();
    setupFormInteractions();
});

/**
 * Initialize the registration form
 */
function initializeRegistrationForm() {
    const form = document.getElementById('regForm'); // ✅ fixed id
    if (!form) return;

    // Ensure candidate fields hidden by default
    const candidateFields = document.getElementById('candidateFields');
    if (candidateFields) {
        candidateFields.style.display = 'none';
    }
}

/**
 * Setup role dropdown toggle functionality
 */
function setupRoleToggle() {
    const roleSelect = document.getElementById('role');
    const candidateFields = document.getElementById('candidateFields');

    if (!roleSelect || !candidateFields) return;

    // Change event listener
    roleSelect.addEventListener('change', function() {
        if (this.value === 'CANDIDATE') {
            showCandidateFields(candidateFields);
        } else {
            hideCandidateFields(candidateFields);
        }
    });
}

/**
 * Show candidate fields with smooth animation
 */
function showCandidateFields(candidateFields) {
    candidateFields.style.display = 'block';
    candidateFields.style.opacity = '0';
    candidateFields.style.transform = 'translateY(-10px)';

    candidateFields.offsetHeight; // force reflow

    setTimeout(() => {
        candidateFields.style.opacity = '1';
        candidateFields.style.transform = 'translateY(0)';
    }, 10);
}

/**
 * Hide candidate fields and clear them
 */
function hideCandidateFields(candidateFields) {
    candidateFields.style.opacity = '0';
    candidateFields.style.transform = 'translateY(-10px)';

    setTimeout(() => {
        candidateFields.style.display = 'none';
        clearCandidateFields();
    }, 250); // match transition
}

/**
 * Clear candidate field values when switching back to voter
 */
function clearCandidateFields() {
    const candidateFieldIds = ['party', 'constituency', 'bio', 'party_logo', 'profile_photo'];
    candidateFieldIds.forEach(id => {
        const field = document.getElementById(id);
        if (field) field.value = '';
    });
}

/**
 * Setup form interactions
 */
function setupFormInteractions() {
    const phoneInput = document.getElementById('phone');
    const dobInput = document.getElementById('dob');
    const form = document.getElementById('regForm');

    // Phone validation (digits only)
    if (phoneInput) {
        phoneInput.addEventListener('input', function () {
            this.value = this.value.replace(/\D/g, "").slice(0, 10);
        });
    }

    // DOB validation (18+)
    if (form && dobInput) {
        form.addEventListener('submit', function (e) {
            const dob = new Date(dobInput.value);
            if (isNaN(dob)) return; // skip if empty

            const today = new Date();
            let age = today.getFullYear() - dob.getFullYear();
            const m = today.getMonth() - dob.getMonth();
            if (m < 0 || (m === 0 && today.getDate() < dob.getDate())) {
                age--;
            }

            if (age < 18) {
                alert("You must be at least 18 years old to register.");
                e.preventDefault();
            }
        });
    }
}

// ✅ export helpers for debugging (optional)
window.RegistrationForm = {
    getCurrentRole: () => document.getElementById('role')?.value,
    isCandidateVisible: () => document.getElementById('candidateFields')?.style.display !== 'none'
};
