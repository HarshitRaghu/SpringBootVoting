// Simplified Login App - Only Password Visibility Functionality

class SimpleLoginApp {
    constructor() {
        this.passwordField = document.getElementById('password');
        this.togglePasswordBtn = document.getElementById('togglePassword');
        this.toggleIcon = document.getElementById('toggleIcon');

        this.initializePasswordToggle();
    }

    initializePasswordToggle() {
        // Only password toggle functionality
        this.togglePasswordBtn.addEventListener('click', () => this.togglePasswordVisibility());
    }

    togglePasswordVisibility() {
        const isPassword = this.passwordField.type === 'password';

        if (isPassword) {
            this.passwordField.type = 'text';
            this.toggleIcon.className = 'bi bi-eye-slash';
            this.togglePasswordBtn.setAttribute('aria-label', 'Hide password');
        } else {
            this.passwordField.type = 'password';
            this.toggleIcon.className = 'bi bi-eye';
            this.togglePasswordBtn.setAttribute('aria-label', 'Show password');
        }

        // Add smooth transition effect
        this.passwordField.style.transition = 'all 0.2s ease';
        this.passwordField.focus();
    }
}

// Initialize the application when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
    const loginApp = new SimpleLoginApp();
});
