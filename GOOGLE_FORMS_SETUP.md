# Google Forms Integration Setup

This guide explains how to set up a real Google Form for the Mextner workshops page.

## Step 1: Create the Google Form

1. Go to https://forms.new/ to create a new form
2. Title: "Mextner Lab Workshop Application"
3. Add the following fields:

### Form Fields

1. **Name** (Short answer, Required)
   - Question: "Your Name"
   
2. **Email** (Short answer, Required)
   - Question: "Email Address"
   - Enable email validation
   
3. **Company** (Short answer, Optional)
   - Question: "Company/Organization"
   
4. **Workshop Interest** (Dropdown, Required)
   - Question: "Which workshop are you interested in?"
   - Options:
     - RAG Workshop
     - MCP Workshop
     - Vibe++ Workshop
     - All workshops
     
5. **Additional Information** (Paragraph, Optional)
   - Question: "Tell us about your goals or specific topics you'd like to cover"

## Step 2: Get the Form IDs

1. Open your form in edit mode
2. Click the three dots menu → "Get pre-filled link"
3. Fill in test data for each field
4. Click "Get link" at the bottom
5. Copy the generated URL

The URL will look like:
```
https://docs.google.com/forms/d/e/1FAIpQLSe.../viewform?entry.XXXXXXX=TestName&entry.YYYYYYY=test@email.com...
```

## Step 3: Extract Entry IDs

From the pre-filled URL, extract the entry IDs for each field:
- Name: entry.XXXXXXX
- Email: entry.YYYYYYY
- Company: entry.ZZZZZZZ
- Workshop: entry.AAAAAAA
- Message: entry.BBBBBBB

## Step 4: Update the Website Code

Replace the placeholder values in `/content/en/workshops/index.md`:

1. Replace the form action URL:
   ```html
   <form action="https://docs.google.com/forms/d/e/YOUR_FORM_ID/formResponse" ...>
   ```

2. Update the entry IDs in the form fields:
   ```html
   <input type="text" name="entry.ACTUAL_NAME_ID" ...>
   <input type="email" name="entry.ACTUAL_EMAIL_ID" ...>
   <!-- etc. -->
   ```

3. Update the JavaScript object with actual entry IDs:
   ```javascript
   const formFields = {
     'name': 'entry.ACTUAL_NAME_ID',
     'email': 'entry.ACTUAL_EMAIL_ID',
     'company': 'entry.ACTUAL_COMPANY_ID',
     'workshop': 'entry.ACTUAL_WORKSHOP_ID'
   };
   ```

4. Update the Google Form short link:
   - Create a short link for your form (Settings → Send → Link → Shorten URL)
   - Replace `https://forms.gle/mextner-workshops-2025` with your actual short link

## Step 5: Configure Form Settings

1. Go to Form Settings (gear icon)
2. Under "Responses":
   - ✓ Collect email addresses
   - ✓ Send responders a copy of their response
3. Under "Presentation":
   - Confirmation message: "Thank you for your interest! We'll contact you within 2 business days."

## Step 6: Set Up Response Notifications

1. Go to Responses tab
2. Click three dots → "Get email notifications for new responses"
3. This will ensure you're notified when someone submits the form

## Pre-filling Forms via URL

The form supports pre-filling via URL parameters. Example:
```
https://mextner.com/en/workshops/?name=John%20Doe&email=john@company.com&company=ACME&workshop=RAG%20Workshop
```

This will:
1. Pre-fill the embedded form on the page
2. Update the Google Form link to include pre-filled values

## Testing

1. Test the embedded form submission
2. Test pre-filling with URL parameters
3. Verify you receive email notifications
4. Check that responses are recorded in Google Sheets

## Troubleshooting

- If form submission opens a new tab with an error, check that all entry IDs are correct
- If pre-filling doesn't work, ensure URL parameters match the field IDs exactly
- For CORS issues, ensure the form action uses HTTPS and has the correct form ID