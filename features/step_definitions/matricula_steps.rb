Entao /^eu deverei ver a linha de opcao de matricula$/ do |tabela|
	tabela.hashes.each do |linha|
	    xpath = "//table/tr[ child::td[contains(., '#{linha[:UnidadeCurricular]}')]  and child::td[contains(., '#{linha[:Categoria]}')]  and child::td[contains(., '#{linha[:Turma]}')]  and   (descendant::input[@value='#{linha[:Matricula]}'] or child::td[contains(., '#{linha[:Matricula]}')])       ]"
	    page.should have_xpath(xpath)
	end
end


Entao /^eu nao deverei ver a linha de opcao de matricula$/ do |tabela| 
	 tabela.hashes.each do |linha|
      xpath = "//table/tr[ child::td[contains(., '#{linha[:UnidadeCurricular]}')]  and child::td[contains(., '#{linha[:Categoria]}')]  and child::td[contains(., '#{linha[:Turma]}')]  and   (descendant::input[@value='#{linha[:Matricula]}'] or child::td[contains(., '#{linha[:Matricula]}')])       ]"
	    page.should have_no_xpath(xpath)
	 end
end


Quando /^eu clicar na opcao "([^"]*)" do item de matricula "([^"]*)"$/ do |link, texto|
  xpath = "//table/tr[ child::td[contains(.,'#{texto}')] ]"
  within(:xpath, xpath) do
    find_button("#{link}").click
  end
end