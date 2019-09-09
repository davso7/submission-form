require "application_system_test_case"

class FormsTest < ApplicationSystemTestCase
  setup do
    @form = forms(:one)
  end

  test "visiting the index" do
    visit forms_url
    assert_selector "h1", text: "Forms"
  end

  test "creating a Form" do
    visit forms_url
    click_on "New Form"

    fill_in "Apellidos", with: @form.apellidos
    fill_in "Cargo", with: @form.cargo
    fill_in "Cedula", with: @form.cedula
    fill_in "Email", with: @form.email
    fill_in "Institucion", with: @form.institucion
    fill_in "Nombre", with: @form.nombre
    fill_in "Profesion", with: @form.profesion
    fill_in "Telefono", with: @form.telefono
    fill_in "User", with: @form.user_id
    click_on "Create Form"

    assert_text "Form was successfully created"
    click_on "Back"
  end

  test "updating a Form" do
    visit forms_url
    click_on "Edit", match: :first

    fill_in "Apellidos", with: @form.apellidos
    fill_in "Cargo", with: @form.cargo
    fill_in "Cedula", with: @form.cedula
    fill_in "Email", with: @form.email
    fill_in "Institucion", with: @form.institucion
    fill_in "Nombre", with: @form.nombre
    fill_in "Profesion", with: @form.profesion
    fill_in "Telefono", with: @form.telefono
    fill_in "User", with: @form.user_id
    click_on "Update Form"

    assert_text "Form was successfully updated"
    click_on "Back"
  end

  test "destroying a Form" do
    visit forms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Form was successfully destroyed"
  end
end
