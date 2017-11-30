import React from 'react'
import Options from '../components/Options'
import ProductGrid from '../components/ProductGrid'

export default class Home extends React.Component {
  constructor(props) {
    super(props)
  }
  render() {
    
    return (
      <div className="container">
        <Options />
        <ProductGrid />
      </div>
      
    )
  }
}
