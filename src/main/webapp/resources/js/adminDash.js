// Admin Dashboard JavaScript
// Note: As requested, no actual functionality is implemented for buttons
// Only navigation between sections is handled

document.addEventListener('DOMContentLoaded', function() {
    initializeNavigation();
    initializeTooltips();
});

// Navigation functionality to switch between dashboard sections
function initializeNavigation() {
    const navLinks = document.querySelectorAll('.sidebar .nav-link');
    const contentSections = document.querySelectorAll('.content-section');
    
    navLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            
            // Remove active class from all nav links
            navLinks.forEach(navLink => navLink.classList.remove('active'));
            
            // Add active class to clicked nav link
            this.classList.add('active');
            
            // Hide all content sections
            contentSections.forEach(section => {
                section.style.display = 'none';
            });
            
            // Show the selected content section
            const targetSection = this.getAttribute('data-section');
            const targetElement = document.getElementById(targetSection + '-section');
            
            if (targetElement) {
                targetElement.style.display = 'block';
                
                // Add fade in animation
                targetElement.style.opacity = '0';
                setTimeout(() => {
                    targetElement.style.opacity = '1';
                }, 50);
            }
        });
    });
}

// Initialize Bootstrap tooltips (if any are added)
function initializeTooltips() {
    const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    const tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });
}

// Sample data for demonstration purposes (not connected to actual functionality)
const sampleData = {
    candidates: [
        {
            id: 1,
            name: "John Smith",
            party: "Democratic Party",
            email: "john.smith@email.com",
            phone: "+1-555-0123",
            status: "Active"
        },
        {
            id: 2,
            name: "Sarah Johnson",
            party: "Republican Party",
            email: "sarah.johnson@email.com",
            phone: "+1-555-0124",
            status: "Active"
        },
        {
            id: 3,
            name: "Michael Brown",
            party: "Independent",
            email: "michael.brown@email.com",
            phone: "+1-555-0125",
            status: "Inactive"
        }
    ],
    voters: [
        {
            id: 1,
            name: "Alice Wilson",
            email: "alice.wilson@email.com",
            phone: "+1-555-0201",
            age: 28,
            status: "Verified"
        },
        {
            id: 2,
            name: "Bob Davis",
            email: "bob.davis@email.com",
            phone: "+1-555-0202",
            age: 35,
            status: "Pending"
        },
        {
            id: 3,
            name: "Carol Martinez",
            email: "carol.martinez@email.com",
            phone: "+1-555-0203",
            age: 42,
            status: "Verified"
        }
    ],
    elections: [
        {
            id: 1,
            title: "Presidential Election 2024",
            startDate: "2024-11-01",
            endDate: "2024-11-30",
            status: "Active"
        },
        {
            id: 2,
            title: "Student Council Election",
            startDate: "2024-10-15",
            endDate: "2024-10-25",
            status: "Completed"
        }
    ],
    results: [
        {
            electionId: 1,
            candidateName: "John Smith",
            votes: 1250,
            percentage: 45.5
        },
        {
            electionId: 1,
            candidateName: "Sarah Johnson",
            votes: 1100,
            percentage: 40.0
        },
        {
            electionId: 1,
            candidateName: "Michael Brown",
            votes: 400,
            percentage: 14.5
        }
    ],
    stats: {
        totalCandidates: 15,
        totalVoters: 2847,
        activeElections: 3,
        completedElections: 12
    }
};

// Utility functions for visual feedback (no actual data operations)

// Add loading state to buttons when clicked (visual feedback only)
function addLoadingState(button) {
    const originalText = button.innerHTML;
    button.innerHTML = '<span class="spinner-border spinner-border-sm me-2"></span>Loading...';
    button.disabled = true;
    
    // Remove loading state after 2 seconds (simulated operation)
    setTimeout(() => {
        button.innerHTML = originalText;
        button.disabled = false;
    }, 2000);
}

// Show success message (visual feedback only)
function showSuccessMessage(message) {
    const toast = document.createElement('div');
    toast.className = 'toast align-items-center text-white bg-success border-0 position-fixed top-0 end-0 m-3';
    toast.style.zIndex = '9999';
    toast.innerHTML = `
        <div class="d-flex">
            <div class="toast-body">
                <i class="bi bi-check-circle me-2"></i>${message}
            </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
        </div>
    `;
    
    document.body.appendChild(toast);
    const bsToast = new bootstrap.Toast(toast);
    bsToast.show();
    
    // Remove toast element after it's hidden
    toast.addEventListener('hidden.bs.toast', () => {
        document.body.removeChild(toast);
    });
}

// Show error message (visual feedback only)
function showErrorMessage(message) {
    const toast = document.createElement('div');
    toast.className = 'toast align-items-center text-white bg-danger border-0 position-fixed top-0 end-0 m-3';
    toast.style.zIndex = '9999';
    toast.innerHTML = `
        <div class="d-flex">
            <div class="toast-body">
                <i class="bi bi-exclamation-triangle me-2"></i>${message}
            </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
        </div>
    `;
    
    document.body.appendChild(toast);
    const bsToast = new bootstrap.Toast(toast);
    bsToast.show();
    
    // Remove toast element after it's hidden
    toast.addEventListener('hidden.bs.toast', () => {
        document.body.removeChild(toast);
    });
}

// Format numbers with commas
function formatNumber(num) {
    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

// Format date for display
function formatDate(dateString) {
    const options = { year: 'numeric', month: 'long', day: 'numeric' };
    return new Date(dateString).toLocaleDateString(undefined, options);
}

// Calculate age from date of birth
function calculateAge(birthDate) {
    const today = new Date();
    const birth = new Date(birthDate);
    let age = today.getFullYear() - birth.getFullYear();
    const monthDiff = today.getMonth() - birth.getMonth();
    
    if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birth.getDate())) {
        age--;
    }
    
    return age;
}

// Validate email format
function validateEmail(email) {
    const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return re.test(email);
}

// Validate phone format
function validatePhone(phone) {
    const re = /^\+?[\d\s\-\(\)]+$/;
    return re.test(phone);
}

// Get status badge class
function getStatusBadgeClass(status) {
    const statusClasses = {
        'Active': 'bg-success',
        'Inactive': 'bg-secondary',
        'Verified': 'bg-success',
        'Pending': 'bg-warning',
        'Completed': 'bg-secondary',
        'Draft': 'bg-warning',
        'Published': 'bg-success'
    };
    
    return statusClasses[status] || 'bg-secondary';
}

// Generate random ID (for display purposes only)
function generateId() {
    return Math.floor(Math.random() * 1000) + Date.now();
}

// Simulate network delay
function simulateNetworkDelay(callback, delay = 1000) {
    setTimeout(callback, delay);
}

// Add event listeners for visual feedback (no actual operations)
document.addEventListener('DOMContentLoaded', function() {
    // Add click handlers to all buttons for visual feedback only
    const buttons = document.querySelectorAll('button:not([data-bs-dismiss]):not([data-bs-toggle])');
    
    buttons.forEach(button => {
        button.addEventListener('click', function(e) {
            // Only prevent default for buttons that aren't Bootstrap components
            if (!this.hasAttribute('data-bs-target') && 
                !this.hasAttribute('data-bs-toggle') && 
                !this.hasAttribute('data-bs-dismiss')) {
                e.preventDefault();
                
                // Add subtle visual feedback
                this.style.transform = 'scale(0.98)';
                setTimeout(() => {
                    this.style.transform = '';
                }, 150);
                
                // Show appropriate message based on button text/context
                const buttonText = this.textContent.trim();
                if (buttonText.includes('Save') || buttonText.includes('Create') || buttonText.includes('Add')) {
                    setTimeout(() => {
                        showSuccessMessage('Operation completed successfully! (Demo mode - no data was actually saved)');
                    }, 500);
                } else if (buttonText.includes('Delete') || buttonText.includes('Remove')) {
                    setTimeout(() => {
                        showSuccessMessage('Item deleted successfully! (Demo mode - no data was actually deleted)');
                    }, 500);
                } else if (buttonText.includes('Publish')) {
                    setTimeout(() => {
                        showSuccessMessage('Results published successfully! (Demo mode)');
                    }, 500);
                } else if (buttonText.includes('Export')) {
                    setTimeout(() => {
                        showSuccessMessage('Export completed! (Demo mode - no file was actually generated)');
                    }, 500);
                }
            }
        });
    });
    
    // Add hover effects to table rows
    const tableRows = document.querySelectorAll('tbody tr');
    tableRows.forEach(row => {
        row.addEventListener('mouseenter', function() {
            this.style.backgroundColor = 'rgba(0, 123, 255, 0.05)';
        });
        
        row.addEventListener('mouseleave', function() {
            this.style.backgroundColor = '';
        });
    });
    
    // Add form validation styling (visual only)
    const forms = document.querySelectorAll('form');
    forms.forEach(form => {
        const inputs = form.querySelectorAll('input, select, textarea');
        inputs.forEach(input => {
            input.addEventListener('blur', function() {
                if (this.hasAttribute('required') && !this.value.trim()) {
                    this.classList.add('is-invalid');
                } else {
                    this.classList.remove('is-invalid');
                    this.classList.add('is-valid');
                }
            });
            
            input.addEventListener('input', function() {
                if (this.classList.contains('is-invalid') && this.value.trim()) {
                    this.classList.remove('is-invalid');
                    this.classList.add('is-valid');
                }
            });
        });
    });
});

// Console message for developers
console.log('🗳️  Voting Portal Admin Dashboard Loaded');
console.log('📋 Demo Mode: All buttons and forms are for display purposes only');
console.log('🔧 No actual data operations are performed');
console.log('📊 Sample data is used for demonstration');

// Export functions for potential future use (not currently used)
window.VotingDashboard = {
    showSuccessMessage,
    showErrorMessage,
    formatNumber,
    formatDate,
    calculateAge,
    validateEmail,
    validatePhone,
    getStatusBadgeClass,
    sampleData
};