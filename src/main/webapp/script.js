// ============================================================
// DevOps Hospital – Main Script
// ============================================================

// ============================================================
// DATA – Departments, Doctors, Testimonials
// ============================================================

const DEPARTMENTS = [
  { id: 'cardiology', name: 'Cardiology', icon: 'fa-heart', count: 12 },
  { id: 'neurology', name: 'Neurology', icon: 'fa-brain', count: 8 },
  { id: 'orthopedics', name: 'Orthopedics', icon: 'fa-bone', count: 15 },
  { id: 'pediatrics', name: 'Pediatrics', icon: 'fa-baby', count: 10 },
  { id: 'radiology', name: 'Radiology', icon: 'fa-x-ray', count: 7 },
  { id: 'emergency', name: 'Emergency', icon: 'fa-ambulance', count: 20 }
];

const DOCTORS = [
  { id: 1, title: 'Dr. Sarah Johnson', price: 'Consultation $120', oldPrice: null, rating: 5, reviews: 48, badge: 'Chief',
    img: 'https://images.unsplash.com/photo-1559839734-2b71ea197ec2?auto=format&fit=crop&w=600&q=80',
    category: 'Cardiology' },
  { id: 2, title: 'Dr. Michael Chen', price: 'Consultation $150', oldPrice: null, rating: 4, reviews: 32, badge: '',
    img: 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?auto=format&fit=crop&w=600&q=80',
    category: 'Neurology' },
  { id: 3, title: 'Dr. Emily Rodriguez', price: 'Consultation $100', oldPrice: '$130', rating: 5, reviews: 56, badge: 'Sale',
    img: 'https://images.unsplash.com/photo-1594824476967-48c8b964273f?auto=format&fit=crop&w=600&q=80',
    category: 'Pediatrics' },
  { id: 4, title: 'Dr. James Okafor', price: 'Consultation $140', rating: 4, reviews: 27, badge: '',
    img: 'https://images.unsplash.com/photo-1622253692010-333f2da6031d?auto=format&fit=crop&w=600&q=80',
    category: 'Orthopedics' },
  { id: 5, title: 'Dr. Priya Sharma', price: 'Consultation $160', rating: 5, reviews: 39, badge: 'New',
    img: 'https://images.unsplash.com/photo-1594824476967-48c8b964273f?auto=format&fit=crop&w=600&q=80',
    category: 'Radiology' },
  { id: 6, title: 'Dr. Robert Kim', price: 'Consultation $110', rating: 5, reviews: 44, badge: '',
    img: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=600&q=80',
    category: 'Emergency' },
  { id: 7, title: 'Dr. Amina Diallo', price: 'Consultation $130', oldPrice: '$150', rating: 4, reviews: 33, badge: 'Sale',
    img: 'https://images.unsplash.com/photo-1573497019940-1c28c88b4f3e?auto=format&fit=crop&w=600&q=80',
    category: 'Cardiology' },
  { id: 8, title: 'Dr. David Park', price: 'Consultation $145', rating: 5, reviews: 51, badge: '',
    img: 'https://images.unsplash.com/photo-1560250097-0b93528c311a?auto=format&fit=crop&w=600&q=80',
    category: 'Neurology' }
];

const TESTIMONIALS = [{
  name: 'Ava Martins',
  role: 'Patient',
  avatar: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=80&q=80',
  text: 'Excellent care and compassionate staff. Dr. Johnson truly listens and explains everything clearly.',
  stars: 5
}, {
  name: 'Michael Lee',
  role: 'Patient',
  avatar: 'https://images.unsplash.com/photo-1546456073-6712f79251bb?auto=format&fit=crop&w=80&q=80',
  text: 'The neurology team is outstanding. I felt supported throughout my treatment journey.',
  stars: 4
}, {
  name: 'Sophia Chen',
  role: 'Patient',
  avatar: 'https://images.unsplash.com/photo-1494790108378-be9c29b29330?auto=format&fit=crop&w=80&q=80',
  text: 'Clean, modern facility with wonderful pediatricians. My children love coming here!',
  stars: 5
}, {
  name: 'James Wilson',
  role: 'Patient',
  avatar: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=80&q=80',
  text: 'Quick emergency response and professional care. Highly recommend DevOps Hospital.',
  stars: 5
}];

// ============================================================
// STATE
// ============================================================
let appointmentCount = 0;

// ============================================================
// DOM REFS
// ============================================================
const categoriesGrid = document.getElementById('categoriesGrid');
const productsGrid = document.getElementById('productsGrid');
const cartCountEl = document.getElementById('cartCount');
const searchInput = document.getElementById('searchInput');
const searchBtn = document.getElementById('searchBtn');
const mobileToggle = document.getElementById('mobileToggle');
const mobileMenu = document.getElementById('mobileMenu');
const newsletterForm = document.getElementById('newsletterForm');
const newsletterEmail = document.getElementById('newsletterEmail');
const newsletterMsg = document.getElementById('newsletterMsg');
const testimonialsList = document.getElementById('testimonialsList');

// ============================================================
// RENDER FUNCTIONS
// ============================================================

function renderDepartments() {
  categoriesGrid.innerHTML = '';
  DEPARTMENTS.forEach(dept => {
    const el = document.createElement('div');
    el.className = 'cat-card';
    el.innerHTML = `
      <div class="icon-wrap"><i class="fas ${dept.icon}"></i></div>
      <h4>${dept.name}</h4>
      <div class="count">${dept.count} specialists</div>
    `;
    el.addEventListener('click', () => {
      searchInput.value = dept.name;
      filterDoctors(dept.name);
      document.getElementById('products').scrollIntoView({ behavior: 'smooth', block: 'start' });
    });
    categoriesGrid.appendChild(el);
  });
}

function renderDoctors(list) {
  productsGrid.innerHTML = '';
  if (!list.length) {
    productsGrid.innerHTML =
    `<p style="grid-column:1/-1;text-align:center;padding:40px;color:var(--muted);">No doctors found for this department.</p>`;
    return;
  }
  list.forEach(doc => {
    const el = document.createElement('article');
    el.className = 'product-card';
    const badgeClass = doc.badge === 'Sale' ? 'sale' : '';
    const badgeHtml = doc.badge ? `<span class="badge ${badgeClass}">${doc.badge}</span>` : '';
    const oldPriceHtml = doc.oldPrice ? `<span class="old-price">${doc.oldPrice}</span>` : '';
    const stars = '★'.repeat(Math.round(doc.rating)) + '☆'.repeat(5 - Math.round(doc.rating));
    el.innerHTML = `
      <div class="img-wrap">
        <img src="${doc.img}" alt="${escapeHtml(doc.title)}" loading="lazy">
        ${badgeHtml}
        <button class="wish-btn" aria-label="Save doctor"><i class="far fa-heart"></i></button>
      </div>
      <div class="body">
        <div class="category-tag">${doc.category}</div>
        <h5>${escapeHtml(doc.title)}</h5>
        <div class="price-row">
          <span class="price">${doc.price}</span>
          ${oldPriceHtml}
        </div>
        <div class="rating">
          ${stars} <span>(${doc.reviews} reviews)</span>
        </div>
      </div>
      <div class="footer">
        <button class="add-btn" data-id="${doc.id}"><i class="fas fa-calendar-plus"></i> Book</button>
      </div>
    `;
    productsGrid.appendChild(el);
  });

  // Book appointment listeners
  productsGrid.querySelectorAll('.add-btn').forEach(btn => {
    btn.addEventListener('click', function(e) {
      e.stopPropagation();
      const id = Number(this.dataset.id);
      bookAppointment(id, this);
    });
  });
}

function renderTestimonials() {
  testimonialsList.innerHTML = '';
  TESTIMONIALS.forEach(t => {
    const stars = '★'.repeat(t.stars) + '☆'.repeat(5 - t.stars);
    const el = document.createElement('div');
    el.className = 'testimonial-card';
    el.innerHTML = `
      <div class="stars">${stars}</div>
      <blockquote>“${escapeHtml(t.text)}”</blockquote>
      <div class="author">
        <img class="avatar" src="${t.avatar}" alt="${escapeHtml(t.name)}" loading="lazy">
        <div>
          <div class="name">${escapeHtml(t.name)}</div>
          <div class="role">${escapeHtml(t.role)}</div>
        </div>
      </div>
    `;
    testimonialsList.appendChild(el);
  });
}

// ============================================================
// UTILITY FUNCTIONS
// ============================================================

function escapeHtml(text) {
  return String(text).replace(/[&<>"']/g, s => ({
    '&': '&amp;',
    '<': '&lt;',
    '>': '&gt;',
    '"': '&quot;',
    "'": '&#39;'
  } [s]));
}

function updateAppointmentCount() {
  cartCountEl.textContent = appointmentCount;
  cartCountEl.style.transform = 'scale(1.3)';
  setTimeout(() => cartCountEl.style.transform = 'scale(1)', 200);
}

function bookAppointment(doctorId, btnEl) {
  const doc = DOCTORS.find(x => x.id === doctorId);
  if (!doc) return;
  appointmentCount++;
  updateAppointmentCount();

  if (btnEl) {
    const orig = btnEl.innerHTML;
    btnEl.innerHTML = '<i class="fas fa-check"></i> Booked';
    btnEl.classList.add('added');
    setTimeout(() => {
      btnEl.innerHTML = orig;
      btnEl.classList.remove('added');
    }, 1500);
  }

  const cartBtn = document.getElementById('cartBtn');
  cartBtn.style.color = 'var(--accent)';
  setTimeout(() => cartBtn.style.color = '', 400);
}

function filterDoctors(query) {
  const q = String(query || '').trim().toLowerCase();
  if (!q) {
    renderDoctors(DOCTORS);
    return;
  }
  const filtered = DOCTORS.filter(doc =>
    doc.title.toLowerCase().includes(q) ||
    doc.category.toLowerCase().includes(q)
  );
  renderDoctors(filtered);
}

// ============================================================
// DEAL TIMER (for health packages)
// ============================================================

(function setupDealTimer() {
  const now = new Date();
  const target = new Date(now.getTime() + (24 * 60 + 36) * 60 * 1000);

  function tick() {
    const diff = target - new Date();
    if (diff <= 0) {
      document.getElementById('dealDays').textContent = '0';
      document.getElementById('dealHours').textContent = '00';
      document.getElementById('dealMinutes').textContent = '00';
      document.getElementById('dealSeconds').textContent = '00';
      return;
    }
    const days = Math.floor(diff / (24 * 3600 * 1000));
    const hours = Math.floor((diff % (24 * 3600 * 1000)) / (3600 * 1000));
    const mins = Math.floor((diff % (3600 * 1000)) / (60 * 1000));
    const secs = Math.floor((diff % (60 * 1000)) / 1000);
    document.getElementById('dealDays').textContent = days;
    document.getElementById('dealHours').textContent = String(hours).padStart(2, '0');
    document.getElementById('dealMinutes').textContent = String(mins).padStart(2, '0');
    document.getElementById('dealSeconds').textContent = String(secs).padStart(2, '0');
  }
  tick();
  setInterval(tick, 1000);
})();

// ============================================================
// EVENT BINDINGS
// ============================================================

// Search
searchBtn.addEventListener('click', () => filterDoctors(searchInput.value));
searchInput.addEventListener('keydown', (e) => {
  if (e.key === 'Enter') filterDoctors(e.target.value);
});

// Mobile menu
mobileToggle.addEventListener('click', () => {
  const isOpen = mobileMenu.style.display === 'block';
  mobileMenu.style.display = isOpen ? 'none' : 'block';
  mobileToggle.innerHTML = isOpen ? '<i class="fas fa-bars"></i>' : '<i class="fas fa-times"></i>';
});

// Close mobile menu on link click
mobileMenu.querySelectorAll('a').forEach(link => {
  link.addEventListener('click', () => {
    mobileMenu.style.display = 'none';
    mobileToggle.innerHTML = '<i class="fas fa-bars"></i>';
  });
});

// Hero buttons
document.getElementById('shopNow').addEventListener('click', () => {
  document.getElementById('products').scrollIntoView({ behavior: 'smooth', block: 'start' });
});
document.getElementById('exploreDeals').addEventListener('click', () => {
  document.getElementById('deals').scrollIntoView({ behavior: 'smooth', block: 'start' });
});

// Deal (Health Package) booking
document.getElementById('buyDeal').addEventListener('click', function() {
  appointmentCount++;
  updateAppointmentCount();
  const orig = this.innerHTML;
  this.innerHTML = '<i class="fas fa-check"></i> Package Booked!';
  this.style.background = 'var(--success)';
  setTimeout(() => {
    this.innerHTML = orig;
    this.style.background = '';
  }, 1600);
});

// Newsletter / Health Tips
newsletterForm.addEventListener('submit', (e) => {
  e.preventDefault();
  const email = newsletterEmail.value.trim();
  if (!email || !email.includes('@')) {
    newsletterMsg.textContent = 'Please enter a valid email address.';
    newsletterMsg.style.color = '#ffb3b3';
    newsletterMsg.style.display = 'block';
    return;
  }
  newsletterMsg.textContent = '✅ Thanks for subscribing to health tips!';
  newsletterMsg.style.color = '#a8e6cf';
  newsletterMsg.style.display = 'block';
  newsletterEmail.value = '';
  setTimeout(() => {
    newsletterMsg.style.display = 'none';
  }, 3500);
});

// Appointment button click feedback
document.getElementById('cartBtn').addEventListener('click', () => {
  alert(`📋 You have ${appointmentCount} appointment${appointmentCount !== 1 ? 's' : ''} booked.`);
});

// Year in footer
document.getElementById('year').textContent = new Date().getFullYear();

// ============================================================
// INIT
// ============================================================

renderDepartments();
renderDoctors(DOCTORS);
renderTestimonials();
updateAppointmentCount();

// Close mobile menu on resize to desktop
window.addEventListener('resize', () => {
  if (window.innerWidth > 768) {
    mobileMenu.style.display = 'none';
    mobileToggle.innerHTML = '<i class="fas fa-bars"></i>';
  }
});

// ============================================================
// CONTACT FORM HANDLING (matching the theme)
// ============================================================

// This handles the contact form if it exists on the page.
// If you have a contact form with id="contact-form", it will work.
document.addEventListener('DOMContentLoaded', function() {
  const contactForm = document.getElementById('contact-form');
  if (contactForm) {
    contactForm.addEventListener('submit', function(e) {
      e.preventDefault();
      const name = document.getElementById('name');
      const email = document.getElementById('email');
      const message = document.getElementById('message');

      if (name && email && message && name.value && email.value && message.value) {
        alert('✅ Thank you for contacting DevOps Hospital! Our team will get back to you within 24 hours.');
        contactForm.reset();
      } else {
        alert('⚠️ Please fill out all fields so we can assist you better.');
      }
    });
  }
});

console.log('🏥 DevOps Hospital — patient‑friendly healthcare demo loaded.');
