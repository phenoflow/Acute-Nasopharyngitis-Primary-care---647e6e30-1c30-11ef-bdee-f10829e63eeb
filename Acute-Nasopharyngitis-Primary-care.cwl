cwlVersion: v1.0
steps:
  read-potential-cases-disc:
    run: read-potential-cases-disc.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
      potentialCases:
        id: potentialCases
        source: potentialCases
  acute-nasopharyngitis-primary-care-diphtheria---primary:
    run: acute-nasopharyngitis-primary-care-diphtheria---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-disc/output
  acute-nasopharyngitis-primary-care-insertion---primary:
    run: acute-nasopharyngitis-primary-care-insertion---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: acute-nasopharyngitis-primary-care-diphtheria---primary/output
  acute-nasopharyngitis-primary-care---primary:
    run: acute-nasopharyngitis-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: acute-nasopharyngitis-primary-care-insertion---primary/output
  acute-nasopharyngitis-primary-care-nasopharynx---primary:
    run: acute-nasopharyngitis-primary-care-nasopharynx---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: acute-nasopharyngitis-primary-care---primary/output
  acute-nasopharyngitis-primary-care-virology---primary:
    run: acute-nasopharyngitis-primary-care-virology---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: acute-nasopharyngitis-primary-care-nasopharynx---primary/output
  acute-nasopharyngitis-primary-care-myiasis---primary:
    run: acute-nasopharyngitis-primary-care-myiasis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: acute-nasopharyngitis-primary-care-virology---primary/output
  acute-nasopharyngitis-primary-care-nasopharyngogram---primary:
    run: acute-nasopharyngitis-primary-care-nasopharyngogram---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: acute-nasopharyngitis-primary-care-myiasis---primary/output
  nasopharyngitis---primary:
    run: nasopharyngitis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: acute-nasopharyngitis-primary-care-nasopharyngogram---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: nasopharyngitis---primary/output
class: Workflow
inputs:
  potentialCases:
    id: potentialCases
    doc: Input of potential cases for processing
    type: File
  inputModule1:
    id: inputModule1
    doc: Python implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
